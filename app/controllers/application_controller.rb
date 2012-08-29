class ApplicationController < ActionController::Base
 
  protect_from_forgery
  include SessionsHelper
  include EmployeeSessionsHelper
  include AgentSessionsHelper
  
end
