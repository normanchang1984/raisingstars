class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :proposals
  has_many :comments
  has_many :userproposalships
  has_many :favorites, :through => :userproposalships, :source => :proposal

end
