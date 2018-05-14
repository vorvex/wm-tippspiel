class Team < ApplicationRecord
  belongs_to :group
  belongs_to :round
  
  COUNTRY_IMAGES = "/images/flags/"
  
  named_scope :still_in, :conditions => "status = 'in'"
  named_scope :already_out, :conditions => "status = 'out'"
  
end

  def flag_url
    COUNTRY_IMAGES + read_attribute(:flag_url) + ".png"
  end


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