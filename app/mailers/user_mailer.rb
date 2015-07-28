class UserMailer < ApplicationMailer

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
    @user = @proposal.email
    @user_order = order.user.email
  end

  def proposal_complete_owner(proposal)
    @proposal = proposal
    @user = @proposal.email
    @proposal_orders = @proposal.orders
  end

  def proposal_complete_users(proposal)
    @proposal = proposal
    @proposal_orders = @proposal.orders
  end

  def proposal_end(proposal)
    @proposal = proposal
  end

end
