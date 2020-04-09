# frozen_string_literal: true

require "rails_helper"

RSpec.describe Exclusion, type: :model do
  let(:subject) { FactoryBot.build(:exclusion) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email_address) }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end
end
