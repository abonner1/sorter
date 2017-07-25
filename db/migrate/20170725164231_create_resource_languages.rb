class CreateResourceLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_languages do |t|
      t.integer :resource_id
      t.integer :language_id
    end
  end
end
