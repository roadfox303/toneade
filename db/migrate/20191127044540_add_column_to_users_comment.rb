class AddColumnToUsersComment < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comment, :text
  end
end
