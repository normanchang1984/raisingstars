require "rails_helper"

RSpec.describe ProposalsController, :type => :controller do

  let(:proposal) {  Proposal.create!(name: "Hexter", email: "hexter.ch@gmail.com", phone: "0983216646", self_intro: "just for test") }

  describe ".index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
  end

  describe ".create" do
    it "with strong parameter" do
      expect(proposal).to permit(:name).for(:create)
    end
  end

  describe '.update' do
  end

  describe '.destory' do
  end

  describe '::favorite' do
  end

end
