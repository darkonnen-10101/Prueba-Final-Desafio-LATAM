class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :tags
    drop_table :projects_tags
  end
end
