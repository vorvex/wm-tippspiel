class AdminController < ApplicationController
before_action :authenticate_admin
  
  def gameresults
    @games = Game.filter_by_round
    @settings = Setting.first
  end
  
  def settings_update
    @setting = Setting.first
    @setting.update(settings_params)
    Refresher.refresh_round
    redirect_to admin_path
  end
  
  def add_goal_to_team_one
    @game = Game.find(params[:id])
    @game.add_goal_for_team_one
    @game.save!
    redirect_to admin_path
  end
  
  def add_goal_to_team_two
    @game = Game.find(params[:id])
    @game.add_goal_for_team_two
    @game.save!
    redirect_to admin_path
  end
  
    def remove_goal_for_team_one
      @game = Game.find(params[:id])
      @game.remove_goal_for_team_one
      @game.save!
      redirect_to admin_path
    end
  
    def remove_goal_for_team_two
      @game = Game.find(params[:id])
      @game.remove_goal_for_team_two
      @game.save!
      redirect_to admin_path
    end
    
    def end_game
      @game = Game.find(params[:id])
      @game.status = "beendet"
      @game.update(game_params)
      @game.save!
      Refresher.refresh_all
      redirect_to admin_path
    end
  
    def gameresult
      @game = Game.find(params[:id])
      if params[:goals_team_one] && params[:goals_team_two] 
        @game.goals_team_one = params[:goals_team_one]
        @game.goals_team_two = params[:goals_team_two]
      end
      @game.status = "beendet"
      @game.save!
      Refresher.refresh_all
      redirect_to admin_path
    end
  
  private
  
  def game_params
    params.require(:game).permit(:goals_team_one, :goals_team_two, :status)
  end
  
  def settings_params
    params.permit(:status)
  end
end