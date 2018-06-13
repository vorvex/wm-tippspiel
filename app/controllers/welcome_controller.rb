class WelcomeController < ApplicationController

  def index
    
  end
  
  def overview
    if user_signed_in?
      @upcoming_games = Game.upcoming(Time.now)
      @recently_finished_games = Game.recently_finished(Time.now)
      @user = User.order(points: :desc).limit(5)
      @all_games = Game.order('gametime ASC')
    else
      redirect_to willkommen_path
    end
  end
  
  def games
    if user_signed_in?
      @all_games = Game.order(gametime: :asc)
      @user = User.order(points: :desc).limit(5)
    else
      redirect_to willkommen_path
    end
  end
  
  def tabelle
    if user_signed_in?
      @user = User.order(points: :desc).paginate(:page => params[:page], :per_page => 10)
    else
      redirect_to willkommen_path
    end
  end
  
  def groups
    if user_signed_in?
      @groups = Group.all
      @user = User.order(points: :desc).limit(5)
    else
      redirect_to willkommen_path
    end
  end
  
  def tipp_abgeben
    @tipp = Tipp.new(tipp_params)
    @game = @tipp.game
    if @game.gametime > Time.now  
      @tipp.save
      flash[:success] = "Tipp erfolgreich abgegeben"
    else
      flash[:warning] = "Tipp nicht gespeichert"
    end
    redirect_back(fallback_location: root_path)
  end
  
  def search
    def search
    if params[:nickname].blank?
      flash.now[:danger] = "Sie haben keinen Namen eigegeben"
    else
      @search = User.find_by_nickname(params[:nickname])
      flash.now[:danger] = "Der von Ihnen eingetragene Nickname existiert nicht" unless @search
    end
    respond_to do |format|
      format.js { render partial: 'shared/result' }
    end
  end
  end
  
  def turnierbaum
    
  end

  def how_to_play
  
  end
  
  def impressum
    
  end
  
  def datenschutz
    
  end
  
  def richtlinien
  
  end
  
  private
  
  def tipp_params
    params.require(:tipp).permit(:user_id, :game_id, :goals_one, :goals_two)
  end
    
end
