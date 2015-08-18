class UserMailer < ApplicationMailer
  default :from => "poster@raisingstar.co"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.proposal_complete_owner.subject
  #
  def proposal_complete_owner(proposal)
    owner_email = proposal.email
    mail(:to => owner_email, :subject => "Raising Stars 擁有專案達標通知")
  end

  def proposal_complete_users(email)
    mail(:to => email, :subject => "Raising Stars 支持專案達標通知" )
  end

  def proposal_get_pay(email_owner)
    mail(:to => email_owner, :subject => "Raising Stars 收到款項通知" )
  end


<<<<<<< HEAD
  def proposal_pay(email_payer, order)
    @order_proposal = order.proposal.title
=======
  def proposal_pay(email_payer)
>>>>>>> afd1a0a7daad2a5c03825f51a6c42416942c3ad8
    mail(:to => email_payer, :subject => "Raising Stars 付款成功通知" )
  end
end
