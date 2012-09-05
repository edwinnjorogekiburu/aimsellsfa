class ApplicationController < ActionController::Base
 
  protect_from_forgery
  include SessionsHelper
  include EmployeeSessionsHelper
  include AgentSessionsHelper
  include OutletsHelper
  include OnhandQuantityHelper
  
  def record_transaction(agent_id, employee_id, outlet_id, item_id, transaction_type_id, unit_price,  transaction_quantity, transaction_value, cash_received)
  		#insert into material transaction
		transaction = MaterialTransaction.new(agent_id: agent_id , employee_id: employee_id , outlet_id: outlet_id , item_id: item_id , transaction_type_id: transaction_type_id , unit_price: unit_price, 
				    						  transaction_quantity: transaction_quantity , transaction_value: transaction_value , cash_received: cash_received)
		if transaction.save
            flash[:success]= "Material Transaction saved"
        else
            flash[:error] = "Material Transaction is not saved."
        end
  end

end
