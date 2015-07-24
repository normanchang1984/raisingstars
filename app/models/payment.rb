class Payment < ActiveRecord::Base

  serialize :params, JSON
  belongs_to :order

  before_validation :setup_amount
  after_update :update_order_status

  def name
    "Rails Exercise Shop"
  end

  private

  def setup_amount
    self.amount = order.amount
  end

  def update_order_status
    if self.paid
      o = self.order
      o.payment_status = "paid"
      o.save( :validate => false )
    end
  end

end
