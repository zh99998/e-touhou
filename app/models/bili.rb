class Bili < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  attr_accessible :content,:x, :y
  attr_accessible :user_id
end
