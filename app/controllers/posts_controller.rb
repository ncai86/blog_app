class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      redirect_to posts_path, :notice => "Blog Entry Created!"
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @posts = current_user.posts.all
  end

end
