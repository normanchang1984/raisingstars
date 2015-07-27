class Proposal < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  belongs_to :user
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :user
  has_many :products
  scope :sort_by_category, -> (category) { where( :category_id =>  category ) }

  #paperclip
  has_attached_file :title_graph_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :title_graph_url, :content_type => /\Aimage\/.*\Z/

  def page_count
    self.increment!(:views)
    self.views
  end

  # still not work ,but i will working on it
  def sort_by_default
    1
  end


end
