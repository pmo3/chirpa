# frozen_string_literal: true

require "rails_helper"
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  subject { Ability.new(user) }
  let(:user) { nil }

  context "when guest user" do
    it { is_expected.to be_able_to(:read, Chirp.new) }
    it { is_expected.to be_able_to(:create, Chirp) }
    it { is_expected.not_to be_able_to(:update, Chirp) }
    it { is_expected.not_to be_able_to(:destroy, Chirp) }
  end

  context "when admin" do
    let(:user) { FactoryBot.create(:admin) }
    it { is_expected.to be_able_to(:manage, :all) }
  end
end
