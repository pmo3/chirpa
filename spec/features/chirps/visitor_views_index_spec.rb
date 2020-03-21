# frozen_string_literal: true

require "rails_helper"

feature "Visitor views the chirps index", type: :feature do
  let!(:chirp) { FactoryBot.create(:chirp) }

  scenario do
    visit root_path
    first(:link, "Browse Chirps").click
    expect(page).to have_content chirp.text
  end
end
