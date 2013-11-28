class PasswordsController < Devise::PasswordsController
   
  # when the user submits the password change form
  def create
  	
  	if params[resource_name][:email]!=""
  	 self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      
       redirect_to sign_in_home_index_path
    else
    	super
    end	
  	
  end

  
end

