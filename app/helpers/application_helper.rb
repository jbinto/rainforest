module ApplicationHelper

  def current_user
    #User.where(:user_id => session[:user_id]).first
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
