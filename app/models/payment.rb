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
      @proposal = o.proposal
      @orders = o.proposal.orders
      o.payment_status = "paid"
      @proposal.progress += o.amount
      @proposal.save!
      if @proposal.progress >= @proposal.target
        UserMailer.delay.proposal_complete_owner(@proposal)
        @orders.each do |p|
          @email = p.email
          UserMailer.delay.proposal_complete_users(@proposal, @email)
        end
      end
      o.save( :validate => false )
    end
  end

end
