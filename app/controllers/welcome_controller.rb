class WelcomeController < ApplicationController
  def index
    @groups = Group.all
    @tipp = Tipp.new
  end
  
  def tipp_abgeben
    
    @tipp = Tipp.create!(:user_id => @current_user, :game_id => params['game_id'], :goals_one => params['goals_one'], :goals_two =>	params['goals_two'])
    redirect_to welcome_path
  end
end
