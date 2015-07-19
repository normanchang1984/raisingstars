class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :proposals
  has_many :comments
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :proposal

  # reward relationship
  has_many :user_reward_proposals
  has_many :rewards, :through => :user_reward_proposals

  def give_reward(reward ,proposal)
    UserRewardProposal.create( :reward_id => reward.id, :proposal_id => proposal.id)
  end

end
