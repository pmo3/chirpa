# frozen_string_literal: true

require "rails_helper"

feature "Visitor sends a chirp", type: :feature do
  let!(:chirp) { FactoryBot.create(:chirp, approved: true) }
  let(:request) { FactoryBot.build(:chirp_request, chirp: chirp) }

  def fill_in_fields(request)
    fill_in "chirp_request[sender]", with: request.sender
    fill_in "chirp_request[recipient]", with: request.recipient
  end

  scenario do
    visit root_path
    first(:link, "Browse Chirps").click
    first(:link, "Chirp a friend").click
    fill_in_fields request
    click_button "Send your chirp"
    expect(page).to have_content "Thank you!"
  end
end
