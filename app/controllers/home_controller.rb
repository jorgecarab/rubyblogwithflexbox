class HomeController < ApplicationController
  before_action :require_login, only: [:userpost]
  def index
    @posts =Post.all.order("created_at DESC")
    if signed_in?
    @myposts = Post.where({:user_id=> current_user.id})
    end

  end

  def show

  end

end
