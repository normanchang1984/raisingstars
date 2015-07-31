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
      if @proposal.status = true
        @email_owner =  @proposal.email
        @email_payer = o.email
        UserMailer.delay.proposal_get_pay(@email_owner)
        UserMailer.delay.proposal_pay(@email_payer)
      elsif @proposal.progress >= @proposal.target
        @proposal.status = true
        @proposal.save
        UserMailer.delay.proposal_complete_owner(@proposal)
        @orders.each do |p|
          @email = p.email
          UserMailer.delay.proposal_complete_users(@email)
        end
      end
      o.save( :validate => false )
    end
  end

end
