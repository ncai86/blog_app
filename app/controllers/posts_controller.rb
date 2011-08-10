class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new({:post => @post})
    render :action => "show"
  end

  def add_comment
    @post = Post.find(params[:id])
    @comment = @post.comments.create(params[:comment])
    if @post.save
      redirect_to post_path(@post), :notice => "Comment Added"
    else
      render :show
    end
  end
end
 
 