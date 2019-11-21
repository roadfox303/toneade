class CreateNices < ActiveRecord::Migration[5.2]
  def change
    create_table :nices do |t|
      t.integer :user_id, null:false
      t.integer :blog_id, null:false
      t.timestamps
    end
  end
end
