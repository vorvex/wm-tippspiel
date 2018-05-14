class Round < ApplicationRecord
  has_many :games
  has_many :teams
  
  belongs_to :team_one, :class_name => "Team", :foreign_key => "team_one"
  belongs_to :team_two, :class_name => "Team", :foreign_key => "team_two"
end
