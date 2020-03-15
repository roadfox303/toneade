class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :product_id, null: false
      t.string :category
      t.string :name, null: false
      t.string :image
      t.text :comment
      t.timestamps
    end
  end
end
