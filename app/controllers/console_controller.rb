class ConsoleController < ApplicationController
	before_action :is_admin
	
	protected
   def is_admin
    unless current_user.admin
			redirect_to root_path
    end
  end
end