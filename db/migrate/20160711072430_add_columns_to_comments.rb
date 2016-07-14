class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :name,  :string, :limit => 255, :after => :user_id
    add_column :comments, :email, :string,:limit => 255, :after => :name
    add_column :comments, :score, :integer, :after => :body
  end
end
