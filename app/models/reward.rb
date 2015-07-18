class Reward < ActiveRecord::Base
  has_many :user_reward_proposals
  has_many :users, :through => :user_reward_proposals
end
