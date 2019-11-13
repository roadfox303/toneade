class AddUserIdAndBlogIdToPhrases < ActiveRecord::Migration[5.2]
  def change
    add_reference :phrases, :user, foreign_key: true
    add_reference :phrases, :blog, foreign_key: true
  end
end
