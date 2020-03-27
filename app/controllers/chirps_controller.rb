# frozen_string_literal: true

class ChirpsController < ApplicationController
  load_and_authorize_resource

  def index
    @chirps = if params[:search_term]
                Chirp.approved.search(params[:search_term]).paginate(page: params[:page])
              else
                Chirp.approved.paginate(page: params[:page], per_page: 10)
              end
    @will_paginate_renderer = WillPaginateRenderer.new
  end

  def new
    @chirp = Chirp.new
  end

  def create
    @chirp = Chirp.new(chirp_params)
    if @chirp.save
      flash[:notice] = "Thank you! Your submission has been received and sent for approval"
      ChirpMailer.with(chirp: @chirp).approval_email.deliver_later
      redirect_to chirps_path
    else
      render :new
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:search_term, :text, :attribution)
  end
end
