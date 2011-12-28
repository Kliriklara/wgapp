class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :wg_id
      t.text :name
      t.string :email

      t.timestamps
    end
  end
end
