class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newsletter, :boolean, :default => true
  end
end
