require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # assert -> it expectst the true
  # refute -> it expects the false

  test "draft? returns true for the draft blog post" do
    # using fixtures, add the fixture name => blog_posts
    # using fixtures a bit slower, because we're using the db
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for the published blog post" do
    refute blog_posts(:published).draft?
  end

  test "draft? returns false for the scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for the published blog post" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for the draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for the scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for the scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for the draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for the published blog post" do
    refute blog_posts(:published).scheduled?
  end
end
