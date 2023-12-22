class BlogPost < ApplicationRecord
    # the validations check the new blog post to make sure the attributes are valid before saving/updating the blog post
    validates :title, presence: true
    validates :body, presence: true
end
