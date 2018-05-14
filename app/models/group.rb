class Group < ActiveRecord::Base
  has_many :teams
  has_many :games
  
  def leader
    teams.find(:all, :conditions => "place = 1").first
  end
  
  def second leader
    teams.find(:all, :conditions => "place = 2").first
  end
end