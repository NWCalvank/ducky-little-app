class CreateFeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :feedings do |t|
      t.references :food, foreign_key: true, null: false
      t.float :amount, null: false
      t.integer :duck_count, null: false
      t.datetime :time, null: false
      t.references :park, foreign_key: true, null: false
      t.boolean :daily, default: false

      t.timestamps
    end
  end
end
