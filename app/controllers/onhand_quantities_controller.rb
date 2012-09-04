class OnhandQuantitiesController < ApplicationController
  
  before_filter :signed_in_agent
  
  def index
    if Outlet.find_by_id(params[:outlet])
    	@onhand_quantities = OnhandQuantity.paginate(page: params[:page], :conditions => [ "agent_id = ?", current_agent.id ])
      check_into_outlet
    else
      flash[:notice]="Please select an outlet to check into."
      redirect_to outlets_path
    end
 
  end

  def edit
  	if checked_in?
      @onhand_quantity = OnhandQuantity.find(params[:id], :conditions => [ "agent_id = ?", current_agent.id ])
    else
      flash[:notice]= "Please Check into an Outlet."
      redirect_to outlets_path
    end
  end

  def update
    #kazi ipo
    @onhand_quantity = OnhandQuantity.find(params[:id], :conditions => [ "agent_id = ?", current_agent.id ])

    if ((is_numeric? params[:quantity_sold]) && (is_numeric? params[:cash_received]))
      if @onhand_quantity.onhand_quantity > params[:quantity_sold].to_i
        if @onhand_quantity.decrement!(:onhand_quantity, by = params[:quantity_sold].to_i)
          cash_in = CashIn.new(agent_id: current_agent.id , item_id: @onhand_quantity.item.id , cash_received: params[:cash_received].to_i , sales_value: (@onhand_quantity.item.retail_price.to_i * params[:quantity_sold].to_i)  )
            if cash_in.save
              flash[:success]="Sale of #{params[:quantity_sold]} units of #{@onhand_quantity.item.name} saved successfully"
              #insert into transactions table
              record_transaction(current_agent.id , current_agent.distributor_id , cookies[:outlet_id] , @onhand_quantity.item.id , 2 , @onhand_quantity.item.price, params[:quantity_sold].to_i , (@onhand_quantity.item.retail_price.to_i * params[:cash_received].to_i) , params[:cash_received].to_i )
              redirect_to outlets_path
            else
              flash[:error]="The cash in transaction was not recorded"
              render 'edit'
            end

        else
          flash[:error]="The sale transaction was not recorded"
          render 'edit'
        end

      else
        flash[:error]="You cannot sell more than #{@onhand_quantity.onhand_quantity} units of #{@onhand_quantity.item.name}"
        render 'edit'
      end
    else
      flash[:error]="Please enter a valid value for the quantity sold and cash recieved"
      render 'edit'
    end
  end

  def is_numeric?(obj) 
     obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

end


