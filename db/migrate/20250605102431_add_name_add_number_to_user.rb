class AddNameAddNumberToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :number, :integer
  end
end
