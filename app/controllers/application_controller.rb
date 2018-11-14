class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  @notifications = Notificacao.all
	
  protected
    def configure_permitted_parameters
      added_attrs = [:nome, :cargo, :nivel_acesso, :login, :email, :telefone, :password, :password_confirmation, :tag, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def to_root
      redirect_to root_path
    end

    def is_superadmin
      unless current_user.admin
        redirect_to root_path
      end
    end

    def is_admin
      unless current_user.nivel_acesso == "Admin" || current_user.admin
        redirect_to root_path
      end
    end

    def is_almoxarife
      if current_user.nivel_acesso == "Requerente"
        redirect_to root_path
      end
    end
end
