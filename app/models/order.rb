class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :product
  belongs_to :proposal
  belongs_to :user

  def paid?
    self.payment_status == "paid"
    @proposal = self.proposal
    @proposal.progress += self.amount
    if @proposal.progress > @proposal.target
      @proposal.status = true
    end
  end
end
