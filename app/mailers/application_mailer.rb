# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "notifications@chirpa.dev"
  layout "mailer"
end
