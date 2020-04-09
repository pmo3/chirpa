# frozen_string_literal: true

class ExclusionsController < ApplicationController
  def new
    @exclusion = Exclusion.new
    @email_address = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
  end

  def create
    @exclusion = Exclusion.new(exclusion_params)
    if @exclusion.save
      redirect_to exclusions_success_path
    else
      render :new
    end
  end

  def success; end

  private

  def exclusion_params
    params.require(:exclusion).permit(:email_address)
  end
end
