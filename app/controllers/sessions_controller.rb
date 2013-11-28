class SessionsController < Devise::SessionsController
  def new
  	respond_to do |format|
     format.js  
    end
  end

  def create
  	if current_user ==nil
       redirect_to sign_in_home_index_path ,notice: 'Please enter Valid email and password.'
    else
      if !current_user.has_role? :user
        redirect_to recommend_home_index_path
      else
        super
      end  
    end        
  end 
end
