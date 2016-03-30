class AddDiscountPercentageToMemberGrades < ActiveRecord::Migration
  def change
    add_column :member_grades, :discount_percentage, :integer, :after => :name
  end
end
