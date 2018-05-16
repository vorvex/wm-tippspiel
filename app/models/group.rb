class Group < ActiveRecord::Base
  has_many :teams
  has_many :games
  
  def leader
    teams.where('place = ?', 1).first
  end
  
  def second_leader
    teams.where('place = ?', 2).first
  end
end