class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :default
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def set_locale
    I18n.locale = 'de' || I18n.default_locale
  end
  
  def default
    @live_games = Game.currently_playing()
    @recently_finished_games = Game.recently_finished(Time.now)
    if user_signed_in?
    @tipp = Tipp.new
    @tipps = User.find(current_user.id).tipps
    end
  end
  
protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
