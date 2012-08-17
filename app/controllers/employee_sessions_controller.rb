class EmployeeSessionsController < ApplicationController
	
  def new
    if signed_in?
      redirect_to administrator_index_path
    elsif employee_signed_in?   
      redirect_to employee_index_path
    else
      
    end
  end

  def create
  	employee = Employee.find_by_email(params[:employee_session][:email])
  if employee && employee.authenticate(params[:employee_session][:password])
    # Sign the user in and redirect to the user's show page.
    employee_sign_in employee
    redirect_back_or employee_index_path
  else
    # Create an error message and re-render the signin form.
    flash.now[:error] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
	  employee_sign_out
    redirect_to signin_path
  end

  def employee_sign_out
    self.current_employee = nil
    cookies.delete(:remember_token)
  end
end
