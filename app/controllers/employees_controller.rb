class EmployeesController < ApplicationController

	def new
		@employee = Employee.new
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
    	@employees = Employee.find(:all)
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
