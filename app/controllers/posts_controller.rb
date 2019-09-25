class PostsController < ApplicationController
  before_action :require_login, only: [:store, :destroy, :delete]

  def index
    @posts =Post.all.order("created_at DESC")
    if signed_in?
    @myposts = Post.where({:user_id=> current_user.id})
    end

  end

  def show
    @post= Post.find(params[:id]) #encontrar  id  actual del post.
  end

  def create
  end

  def store

    #uploads picture to cloud

    @image = Cloudinary::Uploader.upload(params[:media])
    @post = Post.new({:user_id =>current_user.id, :title => params[:title], :body => params[:body], :author => current_user.name,:public_key =>@image['public_id'], :media => @image['secure_url']})

    
     if @post.save
    #create a post object and saves to the database


    else
      render('create')

    end
  end

  def delete

    @posts=Post.where({:user_id=> current_user.id})
  end


  def destroy

  @post=Post.find(params[:"post.id"])
  @image= Cloudinary::Uploader.destroy(@post.public_key)

  @post.destroy

  end

end
