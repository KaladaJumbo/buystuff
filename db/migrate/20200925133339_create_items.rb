class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :weight
      t.float :price

      t.timestamps
    end
  end
end