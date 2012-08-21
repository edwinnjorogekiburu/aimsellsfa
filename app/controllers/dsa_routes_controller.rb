class DsaRoutesController < ApplicationController

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
end
