class CreateShoppers < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :address
      t.integer :max_weight
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
