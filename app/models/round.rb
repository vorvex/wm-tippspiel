class Round < ApplicationRecord
  has_many :games
  has_many :teams
  
  belongs_to :team_one, :class_name => "Team", :foreign_key => "team_one"
  belongs_to :team_two, :class_name => "Team", :foreign_key => "team_two"
  
  def winner_game(game) 
    @game = Game.find(game)
    if @game.goals_team_one > @game.goals_team_two
      @game.team_one
    elsif @game.goals_team_one < @game.goals_team_two
      @game.team_two
    else
      if @game.winner == 1
        return @game.team_one
      elsif @game.winner == 2
        return @game.team_two
      end 
    end
  end
  def loser_game(game) 
    @game = Game.find(game)
    if @game.goals_team_one < @game.goals_team_two
      @game.team_one
    elsif @game.goals_team_one > @game.goals_team_two
      @game.team_two
    else
      if @game.winner == 1
        return @game.team_two
      elsif @game.winner == 2
        return @game.team_one
      end
    end
  end
  
end
