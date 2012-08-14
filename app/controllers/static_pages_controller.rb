class StaticPagesController < ApplicationController
  before_filter :signed_in_employee, only: [:employee_main_menu]

  def home
  end

  def help
  end

  def about
  end

  def location
  end

  def contactus
  end

  def employee_main_menu

  end
  
end
