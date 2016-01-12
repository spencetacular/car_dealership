class CreateSalesmen < ActiveRecord::Migration
  def change
    create_table :salesmen do |t|
      t.string :first_name
      t.string :last_name
      t.float :total_sales
      t.belongs_to :dealership, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
