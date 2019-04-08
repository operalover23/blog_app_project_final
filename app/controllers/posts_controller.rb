class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Blog created successfully"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Blog updated successfully"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @post.destroy
    flash[:notice] = "Blog successfully deleted"
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
