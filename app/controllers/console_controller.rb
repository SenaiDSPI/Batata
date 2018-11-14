class ConsoleController < ApplicationController
	before_action :is_superadmin
end