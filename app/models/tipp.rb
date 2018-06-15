class Tipp < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :game
  validates_presence_of :goals_one, :goals_two, :user_id, :game_id
  validates_numericality_of :goals_one, :goals_two
  
  def points
    game_goals_one = self.game.goals_team_one
    game_goals_two = self.game.goals_team_two
    goals_one = self.goals_one
    goals_two = self.goals_two
    # Nichts richtig
    points_tipp = 0
    #Tendenz und Tore richtig
    return points_tipp += 5 if game_goals_one == goals_one && game_goals_two == goals_two
    # Tendenz und Torverhältnis richtig
    return points_tipp += 3 if ((game_goals_one > game_goals_two && goals_one > goals_two) ||
                           (game_goals_one === game_goals_two && goals_one === goals_two) ||
                           (game_goals_one < game_goals_two && goals_one < goals_two)) &&
                           (game_goals_one - game_goals_two == goals_one - goals_two)
    # Nur Tendenz richtig
    return points_tipp += 1 if ((game_goals_one > game_goals_two && goals_one > goals_two) ||
                           (game_goals_one < game_goals_two && goals_one <= goals_two))
    points_tipp
  end
  
  
end
