module OnhandQuantityHelper

	def check_into_outlet
    	cookies[:outlet_id] = params[:outlet]
  	end

  	def checked_in?
    	if Outlet.find_by_id(cookies[:outlet_id])
      		return true
    	else
      		return false
    	end
  	end

  	def checkout
	    if cookies.delete(:outlet_id)
    		redirect_to outlets_path
      		flash[:success] = "Checked out of Outlet successfully."
    	else
      		redirect_to outlets_path
      		flash[:notice] = "Could not check you out of the outlet"
    	end
  	end
end
