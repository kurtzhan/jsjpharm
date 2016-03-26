class CreateMemberGrades < ActiveRecord::Migration
  def change
    create_table :member_grades do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
