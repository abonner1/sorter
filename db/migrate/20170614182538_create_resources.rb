class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
