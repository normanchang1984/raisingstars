class Product < ActiveRecord::Base
  belongs_to :proposal
  has_many :orders
end
