class UserMailer < ApplicationMailer
  default from: ''

  def welcome_email(user)
    @user = user
    @url = 'http://raisingstars.co/users/sign_in'
    mail(to: @user.email, subjec: 'Welcome to Raising Stars')
  end

  def proposal_update(proposal)
    @proposal = proposal
  end

  def proposal_progress(proposal, order)
    @proposal = proposal
    @user_order = order
  end

  def proposal_complete(proposal)
    @proposal = proposal
    @proposal_orders = @proposal.orders
  end

  def proposal_end(proposal)
    @proposal = proposal
  end

end
