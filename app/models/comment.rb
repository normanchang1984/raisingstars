class Comment < ActiveRecord::Base
  belongs_to :proposal, touch: true
  belongs_to :user
end
