class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :index_friends]

  def index
    if params[:q].present?
      @users = User.search(params[:q])
    else
      @users = User.all.order(created_at: :desc)
    end
  end


  def show
    @posts = @user.posts.order(created_at: :desc)
  end


  def create_friend_request
    current_user.friend_request(@user)
    flash[:notice] = 'Request Send'
    #@friendship = HasFriendship::Friendship.find_by(friendable_id: current_user, friend_id: @user)
    redirect_to user_path(@user)
  end


  def destroy_friend_request
    current_user.decline_request(@user)
    flash[:alert] = 'Request Destroy'
    redirect_to user_path(@user)
  end


  def accept_friend_request
    current_user.accept_request(@user)
    flash[:notice] = 'Friend Added'
    redirect_to user_path(@user)
  end


  def remove_friend
    current_user.remove_friend(@user)
    flash[:alert] = 'Friend Deleted'
    redirect_to user_path(@user)
  end


  def index_friends
    @myfriends = current_user.friends
  end

  private
    def set_user
      @user  = User.find(params[:id])
    end
end
