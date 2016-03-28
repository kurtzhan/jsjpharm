class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :pictures, :dependent => :destroy

  acts_as_taggable
end
