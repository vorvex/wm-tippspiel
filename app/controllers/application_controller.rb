class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :default, :refresh, :airtable
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :authenticate_admin
  
  def set_locale
    I18n.locale = 'de' || I18n.default_locale
  end
  
  def authenticate_admin
    @user = User.find(current_user.id)
    if @user.role_name != 'admin'
      redirect_to root_path
    end
  end
  
  def default
    @live_games = Game.currently_playing()
    @recently_finished_games = Game.recently_finished(Time.now)
    if user_signed_in?
    @tipp = Tipp.new
    @tipps = User.find(current_user.id).tipps
    end
  end
  
  def refresh
    Refresher.game_status
    Refresher.refresh_place
  end
  
  def airtable
    key = Rails.application.secrets.airtable_key
    @client = Airtable::Client.new(key)
    @table = @client.table("appGS9BVcInOfNwnL", "User")
    users = User.all.collect { |obj| obj.id }
    records = @table.all.collect { |obj| obj.user_id }
    missing = users - records
    missing.each do |user|
      u = User.find(user)
      record = Airtable::Record.new(:user_id => u.id, :email => u.email, :nickname => u.nickname)
      @table.create(record)
    end  
  end
protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
