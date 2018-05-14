class Team < ApplicationRecord
  belongs_to :group
  belongs_to :round
  



  def self.countries
    %w(Süd\ Afrika Deutschland Holland England)
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