class AddColumnsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :market_price, :decimal, :precision => 8, :scale => 2, :after => :order
  	add_column :products, :price, :decimal, :precision => 8, :scale => 2, :after => :market_price
  	add_column :products, :short_description, :string, :limit => 500, :after => :price
  	add_column :products, :memo, :string, :limit => 500, :after => :short_description
  	add_column :products, :description, :text, :limit => 4294967295, :after => :memo
  end
end
