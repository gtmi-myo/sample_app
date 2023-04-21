class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user&.authenticate(params[:session][:password]) # same as user && user.authenticate
      reset_session
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)      
      log_in user
      redirect_to user
    else
      #create error message
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new', status: :unprocessable_entity
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end