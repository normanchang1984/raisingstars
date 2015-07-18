require "rails_helper"

RSpec.describe ProposalcommentsController, :type => :controller do

  let(:proposal) { Proposal.create! }
  let(:comment) { proposal.comments.create!(content: "this is a test") }

  describe ".create" do
    it "create validity" do
      post :create, { :proposal_id => proposal.id, :comment => { :content => "QQ "} }
      comment = Comment.last
      expect(comment.content).to eq("QQ")

      # expect(response).to redirect_to( comments_path )
    end
  end

  describe ".update" do

    it "update validity" do
      patch :update, { :proposal_id => proposal.id, :id => comment.id, :comment => { :content =>"revised version" } }

      comment.reload
      expect(comment.content).to eq("revised version")

    end

  end
end