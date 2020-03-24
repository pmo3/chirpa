# frozen_string_literal: true

class ChirpMailer < ApplicationMailer
  def chirp_email
    @chirp_request = params[:chirp_request]
    @chirp = params[:chirp]
    @url = "https://chirpachirpa.com"
    mail(to: @chirp_request.recipient, subject: "A friend has something to say")
  end
end
