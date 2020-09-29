class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shopper_id
      t.string :status
      t.string :name

      t.timestamps
    end
  end
end
