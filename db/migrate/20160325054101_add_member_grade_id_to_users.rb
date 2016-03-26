class AddMemberGradeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_grade_id, :integer
  end
end
