# frozen_string_literal: true

class AddSerialToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :serial, :integer, null: false, default: 1
  end
end
