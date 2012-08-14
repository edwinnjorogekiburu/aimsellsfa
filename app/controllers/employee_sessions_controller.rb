class EmployeeSessionsController < ApplicationController
	
def new
  end

  def create
  	employee = Employee.find_by_email(params[:employee_session][:email])
  if employee && employee.authenticate(params[:employee_session][:password])
    # Sign the user in and redirect to the user's show page.
    sign_in employee
    redirect_to employees_path
  else
    # Create an error message and re-render the signin form.
    flash.now[:error] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
	sign_out
    redirect_to root_path
  end

  def sign_out
    self.current_employee = nil
    cookies.delete(:remember_token)
  end
end
