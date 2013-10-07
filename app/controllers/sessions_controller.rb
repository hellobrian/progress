class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(root_path, :notice => 'Login Successful')
  	else
  		flash.now.alert = "Invalid email or password"
  		render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Successfully logged out!"
  end

end
