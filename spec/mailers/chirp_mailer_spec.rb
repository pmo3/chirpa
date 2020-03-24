# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChirpMailer, type: :mailer do
  let(:chirp) { FactoryBot.create(:chirp) }
  let(:request) { FactoryBot.create(:chirp_request, chirp: chirp) }
  let(:mail) { ChirpMailer.with(chirp: chirp, chirp_request: request).chirp_email.deliver_now }

  it "renders the subject" do
    expect(mail.subject).to eq "A friend has something to say"
  end

  it "renders the receiver email" do
    expect(mail.to).to eq [request.recipient]
  end

  it "renders the from email" do
    expect(mail.from).to eq ["notifications@chirpachirpa.com"]
  end

  it "assigns @chirp" do
    expect(mail.body.encoded).to match chirp.text.encode
  end

  it "attributes the chirp" do
    expect(mail.body.encoded).to match chirp.attribution
  end

  it "mentions who sent the chirp" do
    expect(mail.body.encoded).to match request.sender
  end

  it "links to the site" do
    expect(mail.body.encoded).to match "https://chirpachirpa.com"
  end
end
