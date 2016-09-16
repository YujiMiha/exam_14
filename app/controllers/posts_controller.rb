class PostsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_post, only: [:show, :edit, :update, :destroy]
 before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end
  def show

  end
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿されました！"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿することができませんでした。"
      render :new
    end
  end
  def edit

  end
  def update

    if @post.update(post_params)
      flash[:success] = "更新されました！"
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "更新されませんでした。"
      render :edit
    end
  end
  def destroy

    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image,:caption)
  end
  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
      unless current_user == @post.user
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end
end
