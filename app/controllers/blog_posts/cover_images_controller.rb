class BlogPosts::CoverImagesController < ApplicationController
  before_action :set_blog_post
  before_action :authenticate_user!

  def destroy
    @blog_post.cover_image.purge_later
    redirect_to blog_post_path(@blog_post)
  end

  private
  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
