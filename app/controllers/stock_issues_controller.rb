class StockIssuesController < ApplicationController

	before_filter :signed_in_employee, only: [:index,:new,:create,:edit,:update,:destroy]

	def new
		@stock_issue = StockIssue.new
	end

	def create
	@stock_issue = StockIssue.new(params[:stock_issue])
    if @stock_issue.save
      # Handle a successful save.
      if @onhand_quantity=OnhandQuantity.find_by_item_id(params[:stock_issue][:item_id] , conditions: " agent_id = #{params[:stock_issue][:agent_id]} " )
      	#increment the onhand quantity
      	@onhand_quantity.increment!(:onhand_quantity, by = params[:stock_issue][:issued_quantity].to_i ) 
		
		record_transaction(@stock_issue.agent.id , current_employee.id , cookies[:outlet_id] , @stock_issue.item.id , 1 , @stock_issue.unit_price, @stock_issue.issued_quantity , 0 , 0 )
		redirect_to stock_issues_path
      else
      	#create a new record with the agent id , item id and the on hand quantity
      	@onhand_quantity=OnhandQuantity.new(agent_id: params[:stock_issue][:agent_id],item_id: params[:stock_issue][:item_id],onhand_quantity: params[:stock_issue][:issued_quantity])
      	if @onhand_quantity.save
		      flash[:success] = "Stock issued successfully"
		      redirect_to stock_issues_path
      	else
      		render 'new'
      	end
      end
    else
      render 'new'
    end

	end

	def index
		@stock_issues = StockIssue.paginate(page: params[:page],:per_page => 20, conditions: " employee_id = #{current_employee.id} ")
	end

	def edit
		@stock_issue = StockIssue.find(params[:id] , conditions: " employee_id = #{current_employee.id}")
	end

	def update
		@stock_issue = StockIssue.find(params[:id] , conditions: " employee_id = #{current_employee.id}")
		
		if is_numeric? params[:quantity_returned] 
			if @stock_issue.issued_quantity >= params[:quantity_returned].to_i
			    if @stock_issue.decrement!(:issued_quantity, by = params[:quantity_returned].to_i)
			      # Handle a successful update.
			      @onhand_quantity = OnhandQuantity.find_by_item_id(@stock_issue.item_id , conditions: " agent_id = #{@stock_issue.agent_id} " )
				    if @onhand_quantity.decrement!(:onhand_quantity, by = params[:quantity_returned].to_i)
				    	flash[:success] = "Stock returned successfully"
				      	redirect_to stock_issues_path
				    else
				  		flash[:notice] = "Onhand quantity deduction failed"
			      		render 'edit'
				  	end
			    else
			      render 'edit'
			    end
			else		
			 	  flash[:error] = "You cannot return in excess of #{@stock_issue.issued_quantity} items "
			      render 'edit'
			end
		else
			 flash[:error] = "Please enter a valid return value"
			 render 'edit'
		end
	end

	def destroy
	if StockIssue.find(params[:id],:conditions => [ "employee_id = ?", current_employee.id ]).destroy
	    flash[:success] = "Stock issue deleted."
	    redirect_to stock_issues_path
  	else
	      flash[:notice] = "Stock issue delete failed" 
	      redirect_to stock_issues_path
  	end
  

	end

	def is_numeric?(obj) 
	   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
	end

end
