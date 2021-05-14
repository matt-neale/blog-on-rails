class CommentsController < ApplicationController
  before_action :find_post, only:[:create,:destroy]

  def create
    @comment=Comment.new comment_params
    @comment.post=@post
    
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created'
    else 
      render '/ideas/show'
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

end
