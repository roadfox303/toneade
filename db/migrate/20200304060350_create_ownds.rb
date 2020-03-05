class CreateOwnds < ActiveRecord::Migration[5.2]
  def change
    create_table :ownds do |t|
      t.integer :user_id, null: false
      t.integer :package_id, null: false
      t.timestamps
    end
  end
end
