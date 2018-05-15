class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to overview_path
    else
      redirect_to signup_path
    end
  end
  
  def overview
    @groups = Group.all
    @tipp = Tipp.new
    @tipps = User.find(current_user.id).tipps
  end
  
  def games
    if user_signed_in?
      @upcoming_games = Game.upcoming(Time.now)

    else
      redirect_to login_path
    end
  end
  
  def table
    
  end
  
  def groups
    @groups = Group.all
  end
  
  def tipp_abgeben
    @tipp = Tipp.new(tipp_params)
    @tipp.save
    redirect_to games_path
  end
  
  
  private
  
  def tipp_params
      params.require(:tipp).permit(:user_id, :game_id, :goals_one, :goals_two)
    end
end
