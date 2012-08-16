class AgentTypesController < ApplicationController
	
	def index
		@agent_types = AgentType.paginate(page: params[:page],:per_page => 20)
	end

	def new
		@agent_type = AgentType.new
	end

	def create
	@agent_type = AgentType.new(params[:agent_type])
    if @agent_type.save
      # Handle a successful save.
      flash[:success] = "Agent type created successfully"
      redirect_to agent_types_path
    else
      render 'new'
    end
	end

	def edit
		@agent_type = AgentType.find(params[:id])
	end

	def update
	@agent_type = AgentType.find(params[:id])
    if @agent_type.update_attributes(params[:agent_type])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to agent_types_path
    else
      render 'edit'
    end

	end

	def destroy
	if AgentType.find(params[:id]).destroy
	    flash[:success] = "Agent Type deleted."
	    redirect_to agent_types_path
  	else
	      flash[:notice] = "Agent Type Delete failed" 
	      redirect_to agent_types_path
  	end
  
	end
	
end
