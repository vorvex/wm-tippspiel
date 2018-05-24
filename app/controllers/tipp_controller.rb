class TippController < ApplicationController
  
  def edit
    @tipp = Tipp.find(params[:id])
    @game = @tipp.game
    if @game.status === 'gestartet' || @game.status === 'beendet' || @tipp.user.id != current_user.id    
      redirect_to root_path
    end
  end
  
  def update
    @tipp = Tipp.find(params[:id])
    @game = @tipp.game
    if @tipp.update(tipp_params)
      flash[:success] = "Tipp erfolgreich bearbeitet"
      redirect_to root_path
    else
      flash[:warning] = "Ein Fehler ist aufgetreten"
      render 'edit'
    end
  end

  
private
  
  def tipp_params
    params.require(:tipp).permit(:user_id, :game_id, :goals_one, :goals_two)
  end
    
end