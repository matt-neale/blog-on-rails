class CommentsController < ApplicationController
  before_action :find_post, only:[:create,:destroy]
  before_action :authenticate_user!, only:[:create]
  before_action :authorize_user!, only:[:destroy]

  def create
    @comment=Comment.new comment_params
    @comment.post=@post
    @comment.user = @current_user
    
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created!'
      
    else
      flash[:notice] = "Could not create comment"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment=Comment.find params[:id]
    if @comment.destroy
    redirect_to post_path(@post), notice: 'Comment Deleted'  
    else
      redirect_to root_path
    end
  end

  private
  def find_post
    @post=Post.find params[:post_id]
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
  def authorize_user!
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud,Comment)
  end

end
