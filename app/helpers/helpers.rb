class Helpers 
  
  def self.current_user(session)
    if @user.id == session[:user_id]
      return true 
    end 
  end 
  
  def self.is_logged_in?(session)
    if @user.id == session[:user_id]
      return true 
    end 
  end 
end