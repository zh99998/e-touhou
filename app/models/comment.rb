class Comment < ActiveRecord::Base
  belongs_to :comic
  belongs_to :user
  attr_accessible :content, :user
  attr_accessible :user_id
  validates :user, :presence => true
  validates :content, :presence => true
end
