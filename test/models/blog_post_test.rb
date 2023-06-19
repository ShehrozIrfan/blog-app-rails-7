require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # assert -> it expectst the true
  # refute -> it expects the false

  test "draft? returns true for the draft blog post" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? returns false for the published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for the scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  test "published? returns true for the published blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? returns false for the draft blog post" do
    refute BlogPost.new(published_at: nil).published?
  end

  test "published? returns false for the scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end

  test "scheduled? returns true for the scheduled blog post" do
    assert BlogPost.new(published_at: 1.year.from_now).scheduled?
  end

  test "scheduled? returns false for the draft blog post" do
    refute BlogPost.new(published_at: nil).scheduled?
  end

  test "scheduled? returns false for the published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).scheduled?
  end
end
