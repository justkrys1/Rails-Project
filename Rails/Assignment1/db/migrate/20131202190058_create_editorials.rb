class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :title
      t.string :author
      t.integer :date
      t.string :published
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
