# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:admin) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it "should be valid" do
      expect(subject.valid?).to be true
    end
  end
end
