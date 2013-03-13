class Comic < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :artist, :finished, :name, :publish, :translator, :under_review, :x_rated
  attr_accessible :user_id, :category_id, :pages_attributes, :tag_list
  has_many :pages, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :pages, :allow_destroy => true


  validates :user, :presence => true
  validates :category, :presence => true
  validates :name, :presence => true

  acts_as_taggable
end
