class Team < ApplicationRecord
  belongs_to :group
  belongs_to :round
  
  def goal_difference()
    x = self.goals - self.goals_allowed
    return x
  end
  
  def name_order()
    x = self.position
    y = x[1, 1]
    z = y.to_i
    return z
  end
  
  def change_place(group)
    @teams = Team.where('group_id = ?', group)
    x = 1
    @teams.each do |team|
      if team.points > self.points 
        x += 1
      elsif team.points === self.points && team.goal_difference > self.goal_difference
        x += 1
      elsif team.points === self.points && team.goal_difference === self.goal_difference && team.goals > self.goals
        x += 1
      elsif team.points === self.points && team.goal_difference === self.goal_difference && team.goals === self.goals && team.name_order < self.name_order
        x += 1
      end 
      
      end
    return x
  end
  
  def increase_games_by(value)
    self.games += value
  end

  def increase_wins_by(value)
    self.wins += value
  end

  def increase_draws_by(value)
    self.draw += value
  end

  def increase_losses_by(value)
    self.losses += value
  end
end