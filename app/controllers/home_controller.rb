class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:user_dashboard]
  def index
  	if user_signed_in?
  		if current_user.role == 'user'
  			redirect_to home_user_dashboard_path
  		else
        if current_user.role == 'admin'
          redirect_to admin_dashboard_path
        end
  		end
  	else
  		
  	end
  end

  def user_dashboard
  end

  def contact
  end
end
