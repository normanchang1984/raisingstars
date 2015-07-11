class Proposal < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  belongs_to :user
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :user
end
