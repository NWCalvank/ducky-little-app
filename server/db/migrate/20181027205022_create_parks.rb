class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :key, null: false
      t.string :name, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
