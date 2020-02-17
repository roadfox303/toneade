# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :content
      t.timestamps
    end
  end
end
