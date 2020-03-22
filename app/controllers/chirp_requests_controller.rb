# frozen_string_literal: true

class ChirpRequestsController < ApplicationController
  def new
    @chirp = Chirp.find(params[:chirp_id])
    @chirp_request = ChirpRequest.new
  end

  def create
    @chirp = Chirp.find(params[:chirp_id])
    @chirp_request = @chirp.chirp_requests.new(request_params)
    if @chirp_request.save
      flash[:notice] = "Thank you! Your request has been sent"
      redirect_to chirps_path
    else
      render :new
    end
  end

  def request_params
    params.require(:chirp_request).permit(:sender, :recipient)
  end
end
