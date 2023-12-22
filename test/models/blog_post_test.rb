require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # created tests using fixtures in blog_post.yml ex. blog_posts(:scheduled)
  test "draft? returns true for draft blog post" do
    # assert looks at the value of the next snippet of code, and returns true
    blog_posts(:scheduled)
  end
  test "draft? returns false for published blog post" do
    # refute expects a return of false for published blog post (opposite of assert)
    refute blog_posts(:published).draft?
  end
  test "draft? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for published blog post" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute blog_posts(:published).scheduled?
  end
  
end
