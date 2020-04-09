# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ChirpRequests", type: :request do
  describe "send a chirp request" do
    let(:chirp) { FactoryBot.create(:chirp) }
    let(:request) { FactoryBot.build(:chirp_request, chirp: chirp) }
    let(:subject) {
      post chirp_chirp_requests_path(chirp), params: {
        chirp_request: {
          recipient: request.recipient,
          sender:    request.sender
        }
      }
    }
    let!(:exclusion) { FactoryBot.create(:exclusion, email_address: "excluded@email.com") }
    let(:excluded_request) {
      post chirp_chirp_requests_path(chirp), params: {
        chirp_request: {
          recipient: "excluded@email.com",
          sender:    request.sender
        }
      }
    }
    it "sends an email" do
      expect { subject }.to have_enqueued_job.on_queue("mailers")
    end

    it "does not send email if recipient is excluded" do
      expect { excluded_request }.not_to have_enqueued_job.on_queue("mailers")
    end
  end
end
