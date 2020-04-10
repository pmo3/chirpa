# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "chirpa.dev@gmail.com"
  layout "mailer"
end
