class Payment < ActiveRecord::Base

  serialize :params, JSON
  belongs_to :order

  before_validation :setup_amount
  after_update :update_order_status

  def name
    "RailsExerciseShop"
  end

  private

  def setup_amount
    self.amount = self.order.amount
  end

  def update_order_status
    if self.paid
      o = self.order
      @orders = o.proposal.orders
      o.payment_status = "paid"
      o.proposal.progress += o.amount

      if o.proposal.progress >= o.proposal.target
        UserMailer.delay.proposal_complete_owner(o.proposal)
        @orders.each do |p|
          UserMailer.delay.proposal_complete_user(o.proposal, p.email)
        end
      end
      o.save( :validate => false )
    end
  end

end
