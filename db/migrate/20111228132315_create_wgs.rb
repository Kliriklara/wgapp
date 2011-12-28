class CreateWgs < ActiveRecord::Migration
  def change
    create_table :wgs do |t|
      t.text :name
      t.text :description
      t.date :date
      t.date :reset

      t.timestamps
    end
  end
end
