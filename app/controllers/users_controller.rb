class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    render_404 unless @user
  end

  def login_form
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_by(uid: auth_hash[:uid], provider: "github")
    if user
      flash[:success] = "Logged in as returning user #{user.username}"
    else
      user = User.build_from_github(auth_hash)
      if user.save
        flash[:success] = "Logged in as returning user#{user.username}"
      else
        flash[:error] = "Could NOT create new user account"
        return redirect_to root_path
      end
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def login
    username = params[:username]
    if username and user = User.find_by(username: username)
      session[:user_id] = user.id
      flash[:status] = :success
      flash[:result_text] = "Successfully logged in as existing user #{user.username}"
    else
      user = User.new(username: username)
      if user.save
        session[:user_id] = user.id
        flash[:status] = :success
        flash[:result_text] = "Successfully created new user #{user.username} with ID #{user.id}"
      else
        flash.now[:status] = :failure
        flash.now[:result_text] = "Could not log in"
        flash.now[:messages] = user.errors.messages
        render "login_form", status: :bad_request
        return
      end
    end
    redirect_to root_path
  end

  def delete
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end

  def logout
    if session[:user_id]
      user_params
      unless user.nil?
        session[:user_id] = nil
        flash[:success] = "Successfully logged out"
      else
        session[:user_id] = nil
      end
    else
      flash[:notice] = "Please log in to perform this action"
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :uid, :provider)
  end

end
