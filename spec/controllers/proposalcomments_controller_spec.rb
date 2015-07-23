require "rails_helper"

RSpec.describe ProposalcommentsController, :type => :controller do

  let(:proposal) { Proposal.create! }
  let(:comment) { proposal.comments.create!(content: "this is a test") }

  describe ".create" do

  end

  describe ".update" do

  end
end
