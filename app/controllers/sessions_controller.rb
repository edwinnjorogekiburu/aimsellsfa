class SessionsController < ApplicationController
 
  def new
    if signed_in?
      redirect_to administrator_index_path
    elsif employee_signed_in?   
      redirect_to employee_index_path
    elsif agent_signed_in?
      redirect_to agent_index_path
    else
      
    end
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  if user && user.authenticate(params[:session][:password])
    # Sign the user in and redirect to the user's show page.
    sign_in user
    redirect_back_or administrator_index_path
  else
    # Create an error message and re-render the signin form.
    flash.now[:error] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
	   sign_out
    redirect_to administrator_signin_path
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
