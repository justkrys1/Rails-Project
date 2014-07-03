class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.string :image
      t.integer :rating
      t.references :blog, index: true

      t.timestamps
    end
  end
end
