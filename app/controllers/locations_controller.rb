class LocationsController < ApplicationController
	
	before_filter :signed_in_employee, only: [:index,:new,:create,:edit,:update,:destroy]

	def index
		@locations = Location.paginate(page: params[:page], per_page: 20)
		 if @parent_location = Location.first

		 else
		 	@parent_location=[]
		 end
	end

	def new
		@location = Location.new
		if params[:id]
			parent_location = Location.find(params[:id]) 
			flash.now[:notice] = "Notice: The location to be created will be a sub location of #{parent_location.name}"
		end
	end

	def create
	@location = Location.new(params[:location])
    if @location.save
      # Handle a successful save.
      flash[:success] = "Location created successfully"
      redirect_to locations_path
    else
      render 'new'
    end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update

	@location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to locations_path
    else
      render 'edit'
    end
	end

	def destroy
	if Location.find(params[:id]).destroy
	    flash[:success] = "Location deleted."
	    redirect_to locations_path
  	else
	      flash[:notice] = "Location Delete failed" 
	      redirect_to locations_path
  	end 
	end

end
