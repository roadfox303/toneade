class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.integer :key, null:false, default: 1
      t.integer :scale, null:false, default: 1
      t.integer :bpm, null:false, default: 120
      t.jsonb :master_data, null:false
      t.timestamps
    end
  end
end
