class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to games_path
    else
      redirect_to signup_path
    end
  end
  
  def overview
    if user_signed_in?
      @upcoming_games = Game.upcoming(Time.now)
      @recently_finished_games = Game.recently_finished(Time.now)
    else
      redirect_to login_path
    end
  end
  
  def games
    if user_signed_in?
      @upcoming_games = Game.upcoming(Time.now)
      @recently_finished_games = Game.recently_finished(Time.now)
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
    redirect_to root_path
  end
  
  def how_to_play
  
  end
  
  def impressum
    
  end
  
  def datenschutz
    
  end
  
  def richtlinien
  
  end
  private
  
  def tipp_params
      params.require(:tipp).permit(:user_id, :game_id, :goals_one, :goals_two)
    end
end
