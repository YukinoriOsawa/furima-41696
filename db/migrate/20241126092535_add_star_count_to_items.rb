class AddStarCountToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :star_count, :integer
  end
end
