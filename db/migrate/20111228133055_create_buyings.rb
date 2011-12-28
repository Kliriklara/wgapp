class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|
      t.integer :user_id
      t.text :description
      t.integer :costs
      t.date :date

      t.timestamps
    end
  end
end
