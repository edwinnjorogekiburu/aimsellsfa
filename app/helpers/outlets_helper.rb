module OutletsHelper
	
	def outlets(outlet)
		cookies[:id] = outlet.id
		self.current_outlets = outlet
	end

	def current_outlets=(outlet)
		@current_outlets = outlet
	end

	def current_outlets
		@current_outlets = Outlet.find_by_id(cookies[:id])
	end

	def current_outlets?(outlet)
		outlet == current_outlets
	end
end
