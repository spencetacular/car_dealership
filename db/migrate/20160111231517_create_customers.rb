class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email
      t.belongs_to :dealership, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
