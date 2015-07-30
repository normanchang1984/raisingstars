require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "proposal_complete_owner" do
    let(:mail) { UserMailer.proposal_complete_owner }

    it "renders the headers" do
      expect(mail.subject).to eq("Proposal complete owner")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
