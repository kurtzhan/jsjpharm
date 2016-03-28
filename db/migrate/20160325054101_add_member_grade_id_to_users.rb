class AddMemberGradeIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :member_grade, index: true, foreign_key: true
    end
  end
end
