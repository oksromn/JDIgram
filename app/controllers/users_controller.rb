class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:q].present?
      @users = User.search(params[:q])
    else
      @users = User.all.order(created_at: :desc)
    end
    #@users = User.all.order(created_at: :desc)
  end

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
  end
end
