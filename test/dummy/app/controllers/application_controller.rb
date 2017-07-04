class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    @_current_user ||=
      if session[:current_user_id].present?
        User.where(id: session[:current_user_id]).first
      else
        nil
      end
  end

  def require_signed_in
    unless current_user
      redirect root_url
    end
  end
end
