# frozen_string_literal: true

class ChirpMailer < ApplicationMailer
  def chirp_email
    @chirp_request = params[:chirp_request]
    @chirp = params[:chirp]
    @unsubscribe = params[:unsubscribe]
    mail(to: @chirp_request.recipient, subject: "A friend has something to say")
  end

  def approval_email
    @chirp = params[:chirp]
    @url = "#{Rails.application.routes.default_url_options[:host]}/admin/chirp/#{@chirp.id}"
    mail(to: Rails.application.credentials.admin_email, subject: "A chirp is awaiting approval")
  end
end
