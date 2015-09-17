class Proposal < ActiveRecord::Base
  has_many :comments
  has_many :orders
  belongs_to :category
  belongs_to :user

  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :user
  has_many :products
  scope :sort_by_category, -> (category) { where( :category_id =>  category ) }

  #paperclip
  has_attached_file :title_graph_url, :styles => { :show => "848x364>", :index => "360x235>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :title_graph_url, :content_type => /\Aimage\/.*\Z/

  def page_count
    self.increment!(:views)
    self.views
  end

  def get_paid

  end

  # still not work ,but i will working on it
  def sort_by_default
    1
  end


end
