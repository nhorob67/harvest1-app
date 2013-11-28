class UserMailer < ActionMailer::Base

 
  def welcome_email(current_user_mail,user,content)
  	
    @user_mail = user.email
    @user=user.first_name
    @content=content
   
    mail(from: current_user_mail,to: @user_mail, subject: 'Notification')
  end
end
