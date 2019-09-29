class PostsController < ApplicationController
  before_action :require_login, only: [:store, :destroy, :delete, :edit]

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

    @image = Cloudinary::Uploader.upload(params[:post][:media])
    @post = Post.new({:user_id =>current_user.id, :title => params[:post][:title], :body => params[:post][:body], :author => current_user.name,:public_key =>@image['public_id'], :media => @image['secure_url']})

    if @post.save

    #create a post object and saves to the database
    else
      render('create')

    end
  end

  def edit
  @post= Post.find(params[:id]) #encontrar  id  actual del post.


   end

  def update
    @post= Post.find(params[:id]) #encontrar  id  actual del post.

    @image = Cloudinary::Uploader.upload(params[:post][:media])

   if @post.update_attributes({:title => params[:post][:title], :body => params[:post][:body],:public_key =>@image['public_id'], :media => @image['secure_url'] } )
     redirect_to({ :controller => 'posts', :action => 'show', :id =>@post.id})

   else

     render ('create')
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
