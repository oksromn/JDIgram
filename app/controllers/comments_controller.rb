class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_params

  def create
    @comment = @post.comments.create(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment success'
    end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to post_path(@post), alert: 'Comment deleted' }
    end
  end

  private
    def set_params
      @post = Post.find(params[:post_id])
    end

    def comments_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
