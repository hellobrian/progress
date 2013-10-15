class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "#{@user.first_name.capitalize} welcome to Progress!!")
  end

  def update_email(user)
  end
  
end
