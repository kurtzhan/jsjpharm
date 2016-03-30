class CreateProductMemberGradePrices < ActiveRecord::Migration
  def change
    create_table :product_member_grade_prices do |t|
      t.references :product, index: true, foreign_key: true
      t.references :member_grade, index: true, foreign_key: true
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
