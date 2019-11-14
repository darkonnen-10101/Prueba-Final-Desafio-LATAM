class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :country, :string
    add_column :users, :bio, :text
    add_column :users, :profile_photo, :string
  end
end
