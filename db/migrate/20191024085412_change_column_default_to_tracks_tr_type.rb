class ChangeColumnDefaultToTracksTrType < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tracks, :tr_type, from: 0, to: 1
  end
end
