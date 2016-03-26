class CreateUserDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :user_delivery_addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :province, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.string :address
      t.string :telephone
      t.string :receiver

      t.timestamps null: false
    end
  end
end
