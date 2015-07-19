class Proposal < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  belongs_to :user
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :user

  scope :sort_by_category, -> (category) { where( :category_id =>  category ) }

  def page_count
    self.increment!(:views)
    self.views
  end

  # still not work ,but i will working on it
  def sort_by_default
    1
  end
end
