require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # assert -> it expectst the true
  # refute -> it expects the false

  test "draft? returns true for the draft blog post" do
    assert draft_blog_post.draft?
  end

  test "draft? returns false for the published blog post" do
    refute published_blog_post.draft?
  end

  test "draft? returns false for the scheduled blog post" do
    refute scheduled_blog_post.draft?
  end

  test "published? returns true for the published blog post" do
    assert published_blog_post.published?
  end

  test "published? returns false for the draft blog post" do
    refute draft_blog_post.published?
  end

  test "published? returns false for the scheduled blog post" do
    refute scheduled_blog_post.published?
  end

  test "scheduled? returns true for the scheduled blog post" do
    assert scheduled_blog_post.scheduled?
  end

  test "scheduled? returns false for the draft blog post" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns false for the published blog post" do
    refute published_blog_post.scheduled?
  end

  # we can also write the helper methods in our tests
  def draft_blog_post
    BlogPost.new(published_at: nil)
  end

  def published_blog_post
    BlogPost.new(published_at: 1.year.ago)
  end

  def scheduled_blog_post
    BlogPost.new(published_at: 1.year.from_now)
  end
end
