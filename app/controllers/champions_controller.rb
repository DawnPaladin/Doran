class ChampionsController < ApplicationController

  def index
    @champions = Champion.all
  end

end
