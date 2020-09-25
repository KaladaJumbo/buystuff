class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.string :weight
      t.string :price

      t.timestamps
    end
  end
end
