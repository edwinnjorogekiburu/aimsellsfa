class DsaRoutesController < ApplicationController

  before_filter :signed_in_employee, only: [:new,:create,:edit,:update,:destroy]

def new
	@dsa_route=DsaRoute.new
	@route=Route.find_by_id(params[:route])
end

 def create

	@dsa_route=DsaRoute.new(params[:dsa_route])
	@route=Route.find(params[:dsa_route][:route_id])
	if @dsa_route.save
      # Handle a successful save.
      flash[:success] = "Route assigned successfully"
      redirect_to routes_path
    else
      render 'new'
    end
   
  end

   def edit   
      @dsa_route=DsaRoute.find_by_route_id(params[:id])
      @route=Route.find(params[:id])
   end

   def update
    @dsa_route= DsaRoute.find(params[:id])
    if @dsa_route.update_attributes(params[:dsa_route])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to routes_path
    else
      render 'edit'
    end

   end

   def destroy
    if DsaRoute.find_by_route_id(params[:id]).destroy
      flash[:success] = "Agent has be deassigned from the route"
      redirect_to routes_path
    else
        flash[:notice] = "Route deassignment failed" 
        redirect_to routes_path
    end
  
   end

end
