require "rails_helper"


RSpec.describe Proposal, :type => :model do

  before(:all) do
    # proposal
    create(:proposal)
    # users
    create(:user)
    # rewards
    arr = [ 100, 500, 1000 ]
    arr.each do |f|
      create(:reward, price: f.to_i)
    end
    # categories
    categories = [ "比賽", "出國", "訓練" ]
    categories.each do |f|
      create(:category, name: f )
    end
  end

  let(:proposal1) { Proposal.create!(name: "Test_for_category1", category_id: 1) }
  let(:proposal) {  Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test") }
  let(:category) { Category.first }

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
       @p1 = Proposal.create(name: "p1", category: Category.first)
       @p2 = Proposal.create(name: "p2", category: Category.last)
    end

    it "by category" do
      expect( Proposal.sort_by_category(1) ).to eq( [@p1] )
    end

    it "by default" do
      expect(Proposal.first.sort_by_default).to eq(1)
    end

  end

  # Test for Factory_girl gem
  context "::give_reward" do
    it "show reward" do

    end
    it "show category" do


    end
  end

end
