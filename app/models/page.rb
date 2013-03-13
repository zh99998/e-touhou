class Page < ActiveRecord::Base
  belongs_to :comic
  belongs_to :user
  has_many :bilis
  # attr_accessible :title, :body
  has_attached_file :attachment,
                    :styles => {
                        :thumb => "100x100#",
                        :small => "300x300>",
                        :large => "1000x8000>"
                    }
  validates_attachment_presence :attachment
  attr_accessible :attachment
end
