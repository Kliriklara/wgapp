class AddIndizesToForeigenKeys < ActiveRecord::Migration
  def self.up
  	add_index :users, :wg_id
  	add_index :buyings, :user_id
  end

  def self.down
  	remove_index :users, :wg_id
  	remove_index :buyings, :user_id
  end
end
