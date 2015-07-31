class Order < ActiveRecord::Base

  has_many :line_items, :dependent => :destroy
  belongs_to :product
  belongs_to :proposal
  belongs_to :user

  scope :paid, -> { where( :payment_status => "paid") }

  def paid?
    self.payment_status == "paid"
  end
end
