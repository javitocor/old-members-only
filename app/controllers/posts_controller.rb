class PostsController < ApplicationController
  before_action :check_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post  = Post.new(post_params)
    if @post.save
      flash[:success] = "The post was created"
      redirect_to root_path
    else
      flash[:danger] = "The post was not created"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def check_login
    redirect_to root_path if !logged_in?
  end
end
