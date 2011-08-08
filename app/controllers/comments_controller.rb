class CommentsController < ApplicationController
  def new

  end

  def create
    @post = current_user.posts.find(params[:comment][:post_id])
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      redirect_to post_path(@post), :notice => "Comment Added"
    else
      redirect_to post_path(@post), :notice => "Adding comment failed"
    end
  end

end
