# frozen_string_literal: true

class ChirpsController < ApplicationController
  load_and_authorize_resource

  def index
    @chirps = if params[:search_term]
                Chirp.search(params[:search_term]).paginate(page: params[:page])
              else
                Chirp.all.paginate(page: params[:page], per_page: 10)
              end
    @will_paginate_renderer = WillPaginateRenderer.new
  end

  private

  def chirp_params
    params.require(:chirp).permit(:search_term)
  end
end
