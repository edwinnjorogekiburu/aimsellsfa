module AgentSessionsHelper
	def agent_sign_in(agent)
		cookies.permanent[:remember_token] = agent.remember_token
		self.current_agent = agent
	end

	def current_agent=(agent)
		@current_agent = agent
	end

	def current_agent
		@current_agent ||=  Agent.find_by_remember_token(cookies[:remember_token])
	end

	def current_agent?(agent)
		agent == current_agent
	end

	def agent_signed_in?
		!current_agent.nil?
	end

	def agent_sign_out
		self.current_agent = nil
		cookies.delete(:remember_token)
	end
	
	def signed_in_agent
    	unless agent_signed_in?
      		store_location
      		redirect_to agent_signin_path, notice: "Please sign in." 
    	end
  	end

  	def redirect_back_or(default)
    	redirect_to(session[:return_to] || default)
    	session.delete(:return_to)
  	end

  	def store_location
    	session[:return_to] = request.fullpath
  	end
end
