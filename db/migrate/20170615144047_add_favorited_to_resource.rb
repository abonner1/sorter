class AddFavoritedToResource < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :favorited, :boolean, default: false
  end
end
