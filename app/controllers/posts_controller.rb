class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = @current_user
    
    if @post.save
      flash[:notice] = "Post created successfully!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    
  end

  def edit
    
  end

  def update
    if @post.update post_params
      flash[:notice] = "Post updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy 
      flash[:notice] = "Post deleted"
      redirect_to root_path
    else
      render :show
    end
    
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body) 
  end

  def find_post
    @post = Post.find params[:id]
  end
end
