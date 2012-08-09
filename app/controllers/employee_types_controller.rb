class EmployeeTypesController < ApplicationController
  
  def new
  	@employee_type = EmployeeType.new
  end

  def create
	@employee_type = EmployeeType.new(params[:employee_type])
    if @employee_type.save
      # Handle a successful save.
      flash[:success] = "Employee type created successfully"
      redirect_to employee_types_path
    else
      render 'new'
    end
  end

  def edit
  	@employee_type = EmployeeType.find(params[:id])
  end

  def update
  	@employee_type = EmployeeType.find(params[:id])
	    if @employee_type.update_attributes(params[:employee_type])
	      # Handle a successful update.
	      flash[:success] = "Changes saved Successfully"
	      redirect_to employee_types_path
	    else
	      render 'edit'
	    end
  end

  def index
  	@employee_types = EmployeeType.find(:all)
  end

  def destroy
  	if EmployeeType.find(params[:id]).destroy
	    flash[:success] = "Employee Type deleted."
	    redirect_to employee_types_path
  	else
	      flash[:notice] = "Employee Type Delete failed" 
	      redirect_to employee_types_path
  	end
  end
end
