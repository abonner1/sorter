class CreateResourceComments < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_comments do |t|
      t.integer :resource_id
      t.integer :comment_id
    end
  end
end
