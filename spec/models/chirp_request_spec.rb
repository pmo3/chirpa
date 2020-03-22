# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChirpRequest, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:chirp_request) }
    it { should validate_presence_of(:sender) }
    it { should validate_presence_of(:recipient) }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end
end
