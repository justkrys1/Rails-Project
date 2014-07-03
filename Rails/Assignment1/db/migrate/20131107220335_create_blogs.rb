class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.integer :date
      t.text :content

      t.timestamps
    end
  end
end
