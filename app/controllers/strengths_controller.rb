class StrengthsController < ApplicationController

  def index
    @strengths = Strength.all
    respond_to do |format|
      format.html
      format.json { render json: @strengths }
    end
  end
end
