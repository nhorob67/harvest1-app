class RegistrationsController < Devise::RegistrationsController
	def update
	  @user=current_user
	  @user.first_name=params[:user][:first_name]
	  @user.last_name=params[:user][:last_name]
	  if @user.save
		redirect_to root_path
	  else
		super
	  end
	end
	


end
