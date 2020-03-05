class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :item_id, null: false
      t.integer :category, null: false , default: 0
      t.text :comment
      t.timestamps
    end
  end
end
