class EmployeesController < ApplicationController
	
	before_filter :signed_in_user, only: [:new,:index,:edit, :update,:create,:destroy]

	def new
		@employee = Employee.new
		if @first_employee = Employee.first
			@first_employee = false
		else
			@first_employee = true
		end
	end

	def create
	   @employee = Employee.new(params[:employee])
    if @employee.save
      # Handle a successful save.
      flash[:success] = "Employee created successfully"
      redirect_to employees_path
    else
      render 'new'
    end
	end

	def index	
    	@employees = Employee.paginate(page: params[:page],:per_page => 10)
	end

	def edit
   		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
	    if @employee.update_attributes(params[:employee])
	      # Handle a successful update.
	      flash[:success] = "Changes saved Successfully"
	      redirect_to employees_path
	    else
	      render 'edit'
	    end
	end

	def destroy
	if Employee.find(params[:id]).destroy
	    flash[:success] = "Employee deleted."
	    redirect_to employees_path
  	else
	      flash[:notice] = "Employee Delete failed" 
	      redirect_to console_path
  	end

	end

end
