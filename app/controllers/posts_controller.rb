class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post, notice: "Wassup Bibek! Your article was successfully saved"
    else
      render 'new', notice: "Oh no! Something shit happened and I was unable to save your post"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Hurray! Your article was successfully saved"
    else
      render 'edit', notice: "Oh no Bbk! I could not update the article"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
