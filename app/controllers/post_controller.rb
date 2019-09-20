class PostController < ApplicationController
  before_action :require_login, only: [:store]

  def create
  end

  def store
    
    #uploads picture to cloud
    
    @image = Cloudinary::Uploader.upload(params[:media])
    @post = Post.new({:user_id =>current_user.id, :title => params[:title], :body => params[:body], :author => current_user.name, :media => @image['secure_url']})
    @post.save
    #create a post object and saves to the database

  end
end
