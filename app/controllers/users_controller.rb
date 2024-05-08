class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def detail
    username = params[:username]
    @user = User.where(username: username).first
  end

  def add_user
    @user = User.new
    @user.username = params[:input_username]

    if @user.save
      redirect_to("/users/" + @user.username)
    else
      render :new
    end
  end

  def update_user
    id = params[:id]
    username = params[:input_username]

    @user = User.where(id: id).first
    @user.username = username

    if @user.save
      redirect_to("/users/" + username)
    else
      render :new
    end
  end
end
