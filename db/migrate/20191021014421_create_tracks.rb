class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :type, null:false, default:0
      t.jsonb :instrument, null:false
      t.jsonb :data, null:false
      t.references :phrase, foreign_key: true
      t.timestamps
    end
  end
end
