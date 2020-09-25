class CreateShoppers < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :address
      t.integer :max_weight

      t.timestamps
    end
  end
end
