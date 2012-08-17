class LocationTypesController < ApplicationController

	before_filter :signed_in_employee, only: [:index,:new,:create,:edit,:update,:destroy]

	def index
		@location_types = LocationType.paginate(page: params[:page],per_page: 20) 
	end

	def new
		@location_type = LocationType.new
	end

	def create
	@location_type = LocationType.new(params[:location_type])
    if @location_type.save
      # Handle a successful save.
      flash[:success] = "Location type created successfully"
      redirect_to location_types_path
    else
      render 'new'
    end
	end

	def edit
		@location_type = LocationType.find(params[:id])
	end

	def update
	@location_type = LocationType.find(params[:id])
    if @location_type.update_attributes(params[:location_type])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to location_types_path
    else
      render 'edit'
    end

	end

	def destroy
	if LocationType.find(params[:id]).destroy
	    flash[:success] = "Location Type deleted."
	    redirect_to location_types_path
  	else
	      flash[:notice] = "Location Type Delete failed" 
	      redirect_to location_types_path
  	end 

	end

end
