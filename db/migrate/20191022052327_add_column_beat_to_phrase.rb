class AddColumnBeatToPhrase < ActiveRecord::Migration[5.2]
  def change
    add_column :phrases, :beat, :integer, null: false, default: 1
  end
end
