class OutletsController < ApplicationController
  
  before_filter :signed_in_agent

  def index
    if current_agent.route
  	     @outlets = Outlet.paginate(page: params[:page], conditions: "agent_id = #{current_agent.id} AND route_id = #{current_agent.route.id}" )
    else
         @outlets = Outlet.paginate(page: params[:page], conditions: "agent_id = #{current_agent.id}" )  
         flash[:notice] = "You have not been assigned a route please request your distributor to assign you one"
    end
  end

  def new
  	@outlet = Outlet.new
  end

  def create
  	@outlet = Outlet.new(params[:outlet])
  	if @outlet.save
  		#Create an outlet
  		flash[:success] = "Outlet successfully created"
  		redirect_to outlets_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@outlet = Outlet.find(params[:id], conditions: "agent_id=#{current_agent.id}" )
  end

  def update
  	@outlet = Outlet.find(params[:id], conditions: "agent_id=#{current_agent.id}" )
  	if @outlet.update_attributes(params[:outlet])
  		#Update outlet successfully
  		flash[:success] = "Outlet Changes Successful"
  		redirect_to outlets_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if Outlet.find(params[:id], conditions: "agent_id=#{current_agent.id}" ).destroy
  		flash[:success] = "Outlet Deleted."
  		redirect_to outlets_path
  	else
  		flash[:notice] = "Outlet Delete Failed"
  		redirect_to outlets_path
  	end
  end

end
