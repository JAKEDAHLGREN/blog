class BlogPost < ApplicationRecord
    # active_text initializing statement
    has_rich_text :content
    # the validations check the new blog post to make sure the attributes are valid before saving/updating the blog post
    validates :title, presence: true
    validates :content, presence: true

    scope :sorted, -> { order(published_at: :asc, updated_at: :asc) }
    scope :draft, -> {where(published_at: nil) }
    scope :published, -> {where("published_at <= ?", Time.current)}
    scope :scheduled, -> {where("published_at > ?", Time.current)}

    def draft?
        published_at.nil?
    end

    def published?
        published_at? && published_at <= Time.current
    end

    def scheduled?
        published_at? && published_at > Time.current
    end

end

