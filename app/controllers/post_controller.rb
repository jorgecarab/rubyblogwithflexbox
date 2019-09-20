class PostController < ApplicationController
  def create
  end

  def store

    #uploads picture to cloud
    @image = Cloudinary::Uploader.upload(params[:media])
    @post = Post.new({:title => params[:title], :body => params[:body], :author => params[:author], :media => @image['secure_url']})
    @post.save
    #create a post object and saves to the database

  end
end
