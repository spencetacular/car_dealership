class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.integer :year
      t.boolean :sold
      t.belongs_to :dealership, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
