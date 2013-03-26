class SessionsController < ApplicationController
  def new
  end

  def create
    # The "find_by_email" method is gone in Rails 4
    user = User.where(:email => params[:email]).first

    # Ensure a user was returned, and if so, try to auth. them
    # "has_secure_password" defines authenticate on the model.
    if user && user.authenticate(params[:password])

      # The "session" hash automatically stores cookies in
      # the user's browser. It persists for some time like 2 days.
      session[:user_id] = user.id
      redirect_to products_url, alert: "You are now signed in."
    else
      flash.now[:alert] = "Username or password did not match. Try again."
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to products_path, alert: "You have been signed out."

    # how would they do that? NOt sure what you mean by scrweing with
    # the userid?


  end


end
