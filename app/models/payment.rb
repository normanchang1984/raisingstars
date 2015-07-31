class Payment < ActiveRecord::Base

  serialize :params, JSON
  belongs_to :order

  before_validation :setup_amount
  after_update :update_order_status

  def name
    "RaisingStars"
  end

  private

  def setup_amount
    self.amount = self.order.amount
  end

  def update_order_status
    # TODO: refactors, extract methods to Order and Proposal
    if self.paid
      o = self.order
      proposal = o.proposal
      orders = o.proposal.orders.paid
      o.payment_status = "paid"
      proposal.progress += o.amount
      proposal.save!

      if proposal.status
        UserMailer.delay.proposal_get_pay( proposal.email )
        UserMailer.delay.proposal_pay( o.email )
      elsif proposal.progress >= proposal.target
        proposal.status = true
        proposal.save
        UserMailer.delay.proposal_complete_owner(proposal)
        orders.group(:user_id).each do |p|
          UserMailer.delay.proposal_complete_users( p.email )
        end
      end

      o.save( :validate => false )
    end
  end

end
