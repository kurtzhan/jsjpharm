class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.references :product, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end
