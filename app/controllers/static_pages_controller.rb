class StaticPagesController < ApplicationController
  before_filter :signed_in_employee, only: [:employee_main_menu]
  before_filter :signed_in_user, only: [:administrator_main_menu]

  def home
    if signed_in?
      redirect_to administrator_index_path
    elsif employee_signed_in?   
      redirect_to employee_index_path
    else
      
    end
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

  def administrator_main_menu

  end
  
end
