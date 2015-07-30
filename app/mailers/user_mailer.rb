class UserMailer < ApplicationMailer
  default :from => "poster@@raisingstar.co"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.proposal_complete_owner.subject
  #
  def proposal_complete_owner(proposal)
    owner_email = proposal.email
    mail(:to => owner_email, :subject => "Good")
  end

  def proposal_complete_users(email)
    mail(:to => email, :subject => "it work" )
  end
end
