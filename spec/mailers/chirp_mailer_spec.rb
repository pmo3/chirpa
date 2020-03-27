# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChirpMailer, type: :mailer do
  describe "chirp email" do
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
      expect(mail.body.encoded).to match CGI.escapeHTML chirp.text
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

  describe "approval email" do
    let(:chirp) { FactoryBot.create(:chirp) }
    let(:mail) { ChirpMailer.with(chirp: chirp).approval_email }

    it "renders the subject" do
      expect(mail.subject).to eq "A chirp is awaiting approval"
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [ENV["admin_email"]]
    end

    it "links to the chirp page" do
      expect(mail.body.encoded).to match "#{Rails.application.routes.default_url_options[:host]}/admin/chirp/#{chirp.id}"
    end
  end
end
