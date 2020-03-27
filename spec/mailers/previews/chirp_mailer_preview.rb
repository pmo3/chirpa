# frozen_string_literal: true

class ChirpMailerPreview < ActionMailer::Preview
  def chirp_email
    ChirpMailer.with(
      chirp_request: ChirpRequest.first,
      chirp:         ChirpRequest.first.chirp
    ).chirp_email
  end

  def approval_email
    ChirpApprovalMailer.with(
      chirp: ChirpRequest.first.chirp
    ).approval_email
    end
end
