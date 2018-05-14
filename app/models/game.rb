class Game < ApplicationRecord
  validates_presence_of :gametime
  
  belongs_to :stadium
  belongs_to :group
  belongs_to :round
  has_many :tipps

  belongs_to :team_one, :class_name => "Team", :foreign_key => "team_one"
  belongs_to :team_two, :class_name => "Team", :foreign_key => "team_two"
  
  def teams
    [team_one, team_two]
  end
  
  def is_draw?
    self.goals_team_one == self.goals_team_two
  end

  def winner
    return nil if is_draw?
    self.goals_team_one > self.goals_team_two ? self.team_one : self.team_two
  end

  def loser
    return nil if is_draw?
    self.goals_team_one < self.goals_team_two ? self.team_one : self.team_two
  end
end
