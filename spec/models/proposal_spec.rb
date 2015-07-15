require "rails_helper"

RSpec.describe Proposal, :type => :model do
  context ".create" do
    it "the basic proposal" do
      proposal_testcase_1 = Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test")
      expect(Proposal.last).to eq(proposal_testcase_1)
    end
  end

  context "::view" do
    it "the basic view column" do
      Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test")
      testcase_1 = Proposal.first
      expect(testcase_1.page_count).to eq(testcase_1.views)
    end
  end

end
