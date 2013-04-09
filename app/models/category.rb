class Category < ActiveRecord::Base
  attr_accessible :name, :style
  has_many :comics

  attr_accessible :icon
  has_attached_file :icon, :styles => { :icon => '40x50#' }, :default_url => '/images/logo_hot.png'

end
