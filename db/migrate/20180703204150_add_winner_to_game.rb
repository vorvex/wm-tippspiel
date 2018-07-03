class AddWinnerToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :winner, :integer
    add_column :games, :overtime, :string
  end
end
