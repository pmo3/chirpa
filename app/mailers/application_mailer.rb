# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "notifications@chirpachirpa.com"
  layout "mailer"
end
