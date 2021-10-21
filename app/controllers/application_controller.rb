class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end
  def after_sign_in_path_for(resource)
    dashboard_path	
  end
end
