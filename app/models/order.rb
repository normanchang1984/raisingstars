class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :product
  belongs_to :user

  def paid?
    self.payment_status == "paid"
  end
end
