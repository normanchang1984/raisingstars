# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/proposal_complete_owner
  def proposal_complete_owner
    UserMailer.proposal_complete_owner
  end

end
