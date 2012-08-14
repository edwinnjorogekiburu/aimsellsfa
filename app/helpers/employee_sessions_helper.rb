module EmployeeSessionsHelper
def sign_in(employee)
    cookies.permanent[:remember_token] = employee.remember_token
    self.current_employee = employee
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee
    @current_employee ||= Employee.find_by_remember_token(cookies[:remember_token])
  end

  def current_employee?(employee)
    employee == current_employee
  end
  
  def sign_in(employee)
    cookies.permanent[:remember_token] = employee.remember_token
    self.current_employee = employee
  end

  def signed_in?
    !current_employee.nil?
  end

  def sign_out
    self.current_employee = nil
    cookies.delete(:remember_token)
  end 

  def signed_in_employee
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in." 
    end
  end

  def correct_employee
      @user = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

end
