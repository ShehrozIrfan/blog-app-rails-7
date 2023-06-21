class BlogPosts::CoverImagesController < ApplicationController
  # the dom_id is not available here, so we need to include it
  include ActionView::RecordIdentifier

  before_action :set_blog_post
  before_action :authenticate_user!

  def destroy
    @blog_post.cover_image.purge_later
    # as we need to remove the id using the turbo, we need to make our controller action respond to turbo_stream
    respond_to do |format|
      format.html { redirect_to blog_post_path(@blog_post) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@blog_post, :cover_image)) }
    end

  end

  private
  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
