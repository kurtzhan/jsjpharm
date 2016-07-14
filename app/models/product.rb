class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :pictures, :dependent => :destroy
  has_many :product_member_grade_prices, :dependent => :destroy
  accepts_nested_attributes_for :product_member_grade_prices

  acts_as_taggable
  acts_as_commentable

  paginates_per 5
end
