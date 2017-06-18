class WeaknessesController < ApplicationController

    def index
      @weaknesses = Weakness.all
      respond_to do |format|
        format.html
        format.json { render json: @weaknesses }
      end
    end
end
