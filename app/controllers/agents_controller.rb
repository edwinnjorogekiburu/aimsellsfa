class AgentsController < ApplicationController

  before_filter :signed_in_employee, only: [:index,:new,:create,:edit,:update,:destroy]

  def new
  	@agent = Agent.new
  end

  def create
  	@agent = Agent.new(params[:agent])
    if @agent.save
      # Handle a successful save.
      flash[:success] = "Agent created successfully"
      redirect_to agents_path
    else
      render 'new'
    end
  end

  def index
  	@agents = Agent.paginate(page: params[:page],:per_page => 20)
  end

  def edit
  	@agent = Agent.find(params[:id])
  end

  def update
	@agent = Agent.find(params[:id])
    if @agent.update_attributes(params[:agent])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to agents_path
    else
      render 'edit'
    end

  end

  def destroy
  	if Agent.find(params[:id]).destroy
	    flash[:success] = "Agent deleted."
	    redirect_to agents_path
  	else
	      flash[:notice] = "Agent Delete failed" 
	      redirect_to agents_path
  	end
  
  end

end
