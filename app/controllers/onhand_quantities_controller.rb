class OnhandQuantitiesController < ApplicationController
  
  before_filter :signed_in_agent
  
  def index
  	@onhand_quantities = OnhandQuantity.paginate(page: params[:page], :conditions => [ "agent_id = ?", current_agent.id ])
  end

  def edit
  	@onhand_quantity = OnhandQuantity.find(params[:id], :conditions => [ "agent_id = ?", current_agent.id ])
  end

  def update
  #kazi ipo
  end

end
