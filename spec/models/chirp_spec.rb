# frozen_string_literal: true

require "rails_helper"

RSpec.describe Chirp, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:chirp) }
    it { should validate_presence_of(:text) }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end
end
