class AdminController < ApplicationController
before_action :authenticate_admin
  
  def gameresults
    @games = Game.all.limit(10)
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
      @game.goals_team_one = params[:goals_team_one]
      @game.goals_team_two = params[:goals_team_two]
      @game.status = "beendet"
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
end