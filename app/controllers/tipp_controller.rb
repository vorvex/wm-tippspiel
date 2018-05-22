class TippController < ApplicationController
  
  def edit
    @tipp = Tipp.find(params[:id])
    @game = @tipp.game
    if @game.status != 'gestartet' && @game.status =! 'beendet' && @tipp.user === current_user    
    else
      redirect_to root_path
    end
  end
  
end