class AddFavoritedToResourceTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :resource_topics, :favorited, :boolean
  end
end
