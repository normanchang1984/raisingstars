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
      o.payment_status = "paid"
      o.proposal.progress += o.amount
      o.proposal.
      if o.proposal.progress >= o.proposal.target
        UserMailer.delay.proposal_complete_owner(o.proposal)

        UserMailer.delay.proposal_complete_user(o.proposal)
      end
      o.save( :validate => false )
    end
  end

end
