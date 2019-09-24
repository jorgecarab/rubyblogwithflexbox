class PostController < ApplicationController
  before_action :require_login, only: [:store, :destroy, :delete]

  def create
  end

  def store
    
    #uploads picture to cloud
    
    @image = Cloudinary::Uploader.upload(params[:media])
    @post = Post.new({:user_id =>current_user.id, :title => params[:title], :body => params[:body], :author => current_user.name, :media => @image['secure_url']})
    @post.save
    #create a post object and saves to the database

  end

  def delete
    
    @posts=Post.where({:user_id=> current_user.id})
  end


  def destroy
    
   @post=Post.find(params[:"post.id"])
   @post.destroy


   

   
  end

end
