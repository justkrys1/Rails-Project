class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :qty
      t.decimal :price
      t.decimal :cost
      t.decimal :weight
      t.string :thumbnail
      t.string :fullsize

      t.timestamps
    end
  end
end
