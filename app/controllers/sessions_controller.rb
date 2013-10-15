class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(user_path(current_user.id), :notice => 'Login Successful')
  	else
  		flash.now.alert = "Invalid email or password"
  		render :new
      # respond_to do |format|
      #   format.js
      # end
  	end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Successfully logged out!"
  end

end
