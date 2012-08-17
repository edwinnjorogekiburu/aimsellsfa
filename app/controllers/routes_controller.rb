class RoutesController < ApplicationController

	before_filter :signed_in_employee, only: [:index,:new,:create,:edit,:update,:destroy]

	def index
		@routes = Route.paginate(page: params[:page], per_page: 20)
	end

	def new
		@route = Route.new
	end

	def create
	@route = Route.new(params[:route])
    if @route.save
      # Handle a successful save.
      flash[:success] = "Route created successfully"
      redirect_to routes_path
    else
      render 'new'
    end
	end

	def edit
		@route = Route.find(params[:id])
	end

	def update

	@route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to routes_path
    else
      render 'edit'
    end
	end

	def destroy
	if Route.find(params[:id]).destroy
	    flash[:success] = "Route deleted."
	    redirect_to routes_path
  	else
	      flash[:notice] = "Route Delete failed" 
	      redirect_to routes_path
  	end 
	end

end
