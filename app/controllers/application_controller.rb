class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :default
  
  def set_locale
    I18n.locale = 'de' || I18n.default_locale
  end
  
  def default
    @live_games = Game.currently_playing()
    @recently_finished_games = Game.recently_finished(Time.now)
    @tipp = Tipp.new
    @tipps = User.find(current_user.id).tipps
  end
end
