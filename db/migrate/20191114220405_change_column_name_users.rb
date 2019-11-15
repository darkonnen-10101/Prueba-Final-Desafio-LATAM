class ChangeColumnNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :country, :city
  end
end
