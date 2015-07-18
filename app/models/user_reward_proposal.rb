class UserRewardProposal < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :reward
end
