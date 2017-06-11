class ChampionsController < ApplicationController

  def index
    @champions = Champion.all
    respond_to do |format|
      format.html
      format.json { render json: @champions }
    end
  end

end
