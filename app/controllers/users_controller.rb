class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Account Created"
    else
      render :new, :alert => "Please try again"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end
end
