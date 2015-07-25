class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :proposals
  has_many :comments
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :proposal
  has_one :profile
  has_many :orders

  # facebook login
  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def toggle_like_proposal(proposal)
    result = Userproposalship.find_by( :user_id => self.id, :proposal_id => proposal.id)
    if result
      result.delete
      return false
    else
      Userproposalship.create!( :user_id => self.id, :proposal_id => proposal.id)
      return true
    end
  end

end
