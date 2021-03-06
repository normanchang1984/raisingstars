class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_validation :setup_default_avatars, :on => :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :proposals
  has_many :comments
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :proposal
  has_one :profile
  has_many :orders

  has_attached_file :avatar_graph_url, :styles => { :show => "848x364>", :index => "360x235>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar_graph_url, :content_type => /\Aimage\/.*\Z/

  # facebook login
  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_avatar_url = auth.info.image
      user.fb_name = auth.info.name
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_avatar_url = auth.info.image
      existing_user.fb_name = auth.info.name
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_avatar_url = auth.info.image
    user.fb_uid = auth.uid
    user.fb_name = auth.info.name
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
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

  # TODO: use role column
  def admin?
    Rails.env.development?
  end

  def setup_default_avatars
    self.default_avatar_url = Faker::Avatar.image
  end

  def check_avatar
    avatar_url = self.fb_avatar_url
    if self.fb_avatar_url.nil?
      avatar_url = self.avatar_graph_url
    end
    if self.avatar_graph_url.nil?
      avatar_url = self.default_avatar_url
    end
    return avatar_url
  end

end
