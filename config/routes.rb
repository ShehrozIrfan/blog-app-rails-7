Rails.application.routes.draw do
  devise_for :users
  # get '/blog_posts/new', to: "blog_posts#new", as: :new_blog_post
  # get '/blog_posts/:id', to: "blog_posts#show", as: :blog_post
  # get 'blog_posts/:id/edit', to: "blog_posts#edit", as: :edit_blog_post
  # post 'blog_posts', to: "blog_posts#create", as: :blog_posts
  # patch 'blog_posts/:id', to: "blog_posts#update"
  # delete 'blog_posts/:id', to: 'blog_posts#destroy'

  resources :blog_posts do
    # the statement below creates the route like this:
    # blog_post_cover_image DELETE /blog_posts/:blog_post_id/cover_image(.:format) cover_images#destroy

    # and the controller name is cover_images and action is destroy
    # resource :cover_image, only: :destroy

    # but we want it to be in the blog_posts, so we can add the module

    # the statement below creates the route like this:
    # blog_post_cover_image DELETE /blog_posts/:blog_post_id/cover_image(.:format) blog_posts/cover_images#destroy
    resource :cover_image, only: :destroy, module: :blog_posts
  end
  root "blog_posts#index"
end
