class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.string :url
      t.string :project_photo
      t.text :lead
      t.text :description
      t.string :repository
      t.timestamps
    end
  end
end
