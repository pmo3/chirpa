# frozen_string_literal: true

class ChirpsController < ApplicationController
  load_and_authorize_resource

  def index
    @chirps = if params[:search_term]
                Chirp.search(params[:search_term])
              else
                Chirp.all
              end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:search_term)
  end
end
