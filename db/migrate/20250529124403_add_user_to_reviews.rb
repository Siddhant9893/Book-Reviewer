class AddUserToReviews < ActiveRecord::Migration[8.0]
  def change
    add_reference :reviews, :user, null: true, foreign_key: true
  end
end
