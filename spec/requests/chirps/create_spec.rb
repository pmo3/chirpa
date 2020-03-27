# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ChirpsController", type: :request do
  let(:chirp) { FactoryBot.build(:chirp) }
  let(:subject) {
    post chirps_path, params: {
      chirp: {
        text:        chirp.text,
        attribution: chirp.attribution
      }
    }
  }

  it "sends an email" do
    expect { subject }.to have_enqueued_job.on_queue "mailers"
  end
end
