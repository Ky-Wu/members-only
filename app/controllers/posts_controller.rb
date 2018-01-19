class PostsController < ApplicationController
  before_action :user_only, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

    def user_only
      redirect_to root_url unless logged_in?
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
