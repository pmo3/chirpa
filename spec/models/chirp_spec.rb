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

  describe "::search" do
    let!(:by_text) { FactoryBot.create(:chirp, text: "searchtext") }
    let!(:by_author) { FactoryBot.create(:chirp, attribution: "searchauthor") }

    before do
      2.times { FactoryBot.create(:chirp) }
    end

    describe "by text" do
      it "should find chirps by their text" do
        expect(Chirp.search("searchtext").first).to eq by_text
      end

      it "should not include other chirps" do
        expect(Chirp.search("searchtext").count).to eq 1
      end
    end

    describe "by attribution" do
      it "should find chirps by attribution" do
        expect(Chirp.search("searchauthor").first).to eq by_author
      end

      it "should not include other chirps" do
        expect(Chirp.search("searchauthor").count).to eq 1
      end
    end
  end
end
