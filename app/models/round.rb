class Round < ApplicationRecord
  has_many :games
  has_many :teams
  
  belongs_to :team_one, :class_name => "Team", :foreign_key => "team_one"
  belongs_to :team_two, :class_name => "Team", :foreign_key => "team_two"
  
  def winner_game(game) 
    @game = Game.find(game-1)
    if @game.goals_team_one > @game.goals_team_two
      @game.team_one
    else
      @game.team_two
    end
  end
  def loser_game(game) 
    @game = Game.find(game-1)
    if @game.goals_team_one < @game.goals_team_two
      @game.team_one
    else
      @game.team_two
    end
  end
  
end
