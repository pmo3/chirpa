# frozen_string_literal: true

require "rails_helper"

feature "Visitor suggests a new chirp" do
  let(:chirp) { FactoryBot.build(:chirp) }
  let(:invalid) { FactoryBot.build(:chirp, text: nil) }
  scenario "with valid input" do
    visit chirps_path
    click_link "Suggest a new chirp"
    fill_in "chirp[text]", with: chirp.text
    fill_in "chirp[attribution]", with: chirp.attribution
    click_button "Submit"
    expect(page).to have_content "Thank you! Your submission has been received and sent for approval"
  end

  scenario "with invalid input" do
    visit chirps_path
    click_link "Suggest a new chirp"
    fill_in "chirp[text]", with: invalid.text
    fill_in "chirp[attribution]", with: invalid.attribution
    click_button "Submit"
    expect(page).to have_content "The form contains 1 error"
  end
end
