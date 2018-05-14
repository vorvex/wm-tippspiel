class WelcomeController < ApplicationController
  def index
    @groups = Group.all
    @tipp = Tipp.new
    @tipps = User.find(current_user.id).tipps
  end
  
  def tipp_abgeben
    @tipp = Tipp.new(tipp_params)
    @tipp.save
    redirect_to root_path
  end
  
  private
  
  def tipp_params
      params.require(:tipp).permit(:user_id, :game_id, :goals_one, :goals_two)
    end
end
