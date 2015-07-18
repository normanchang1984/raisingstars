require "rails_helper"


RSpec.describe Proposal, :type => :model do

  let(:proposal1) { Proposal.create!(name: "Test_for_category1", category_id: 1) }
  let(:proposal2) { Proposal.create!(name: "Test_for_category2", category_id: 2) }
  let(:proposal3) { Proposal.create!(name: "Test_for_category3", category_id: 3) }

  let(:proposal) {  Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test") }

  let(:category) { Category.create!( :name => "ccc") }

  context ".create" do
    it "the basic proposal" do
      expect(proposal).to eq(proposal)
    end
    it "the proposal with category" do
      Proposal.create!(name: "Hexter", category_id: category)
    end
  end

  context "::view" do
    it "the basic view column" do
      Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test")
      expect(proposal.page_count).to eq(proposal.views)
    end
  end

  context "::sort" do
    before do
       @c1 = Category.create(id: 10)
       @c2 = Category.create(id: 11)

       @p1 = Proposal.create(name: "p1", category: @c1)
       @p2 = Proposal.create(name: "p2", category: @c2)
    end

    it "by category" do
      expect( Proposal.sort_by_category(10) ).to eq( [@p1] )
    end

    it "by default" do
      expect(Proposal.first.sort_by_default).to eq(1)
    end

  end

end
