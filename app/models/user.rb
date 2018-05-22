class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => {email: true, login: false}
  
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 25 }
  
  has_many :tipps
  
  attr_writer :login

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
  
  def position()
    x = User.where('points > ?', self.points).count + 1
    return x
  end
end
