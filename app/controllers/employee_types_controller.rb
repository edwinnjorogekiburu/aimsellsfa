class EmployeeTypesController < ApplicationController

  before_filter :signed_in_user, only: [:new,:index,:edit, :update,:create,:destroy]
  
  def new
  	@employee_type = EmployeeType.new
    if params[:id] 
      senior=EmployeeType.find(params[:id])
      flash.now[:notice] = "The employee type to be created will report to the #{senior.name}"
    end
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
  	@employee_types = EmployeeType.paginate(page: params[:page],:per_page => 10)
    @ceo = EmployeeType.first
    @type_level_count = EmployeeType.count('reports_to_type_id',distinct: true)
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
