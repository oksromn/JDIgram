class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_params

  def create
    @comment = @post.comments.build(comments_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment success'
    end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def set_params
      @post = Post.find(params[:post_id])
    end

    def comments_params
      params.require(:comment).permit(:comment)
    end
end
