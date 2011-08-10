class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to author_posts_path, :notice => "Logged in!"  # should redirect them back to their blog index page
    else
      flash[:notice] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Successfully logged out!"
  end
end
