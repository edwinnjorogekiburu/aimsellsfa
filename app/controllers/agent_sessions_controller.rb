class AgentSessionsController < ApplicationController
  
  def new

  end

  def create
  	agent = Agent.find_by_email(params[:agent_session][:email])
  	if agent && agent.authenticate(params[:agent_session][:password])
  		#Sign in agent
  		agent_sign_in agent
  		redirect_to agent_index_path
  	else
  		flash.now[:error] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
    agent_sign_out
    redirect_to agent_signin_path
  end

end
