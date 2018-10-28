class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :key, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :country, null: false, default: ''

      t.timestamps
    end
  end
end
