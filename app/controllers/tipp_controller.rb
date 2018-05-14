class TippController < ApplicationController
  
  def edit
    @tipp = Tipp.find(params[:id])
  end
  
end