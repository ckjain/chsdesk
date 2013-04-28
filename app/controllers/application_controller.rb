class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  around_filter :scope_current_tenant
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user
  
  def current_tenant
  Tenant.find_by_subdomain! request.subdomain
  end
  helper_method :current_tenant
  
  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
