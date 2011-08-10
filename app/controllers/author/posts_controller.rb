class Author::PostsController < ApplicationController
  before_filter :check_login, :except => [:show, :add_comment]
  
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
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated')
    else
      render :action => "edit"
    end

  end

  def edit
    @post = current_user.posts.find(params[:id])

  end

  def destroy
    @post = current_user.posts.find(params[:id])

    if @post.destroy
      redirect_to posts_path, :notice => "Blog Entry Deleted"
    else
      redirect_to posts_path, :notice => "Delete Failed"
    end

  end

  def index
    @posts = current_user.posts.all
  end

end
