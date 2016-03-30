class ProductMemberGradePrice < ActiveRecord::Base
  belongs_to :product
  belongs_to :member_grade
end
