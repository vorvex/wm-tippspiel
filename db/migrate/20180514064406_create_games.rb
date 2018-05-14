class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :group_id
      t.integer :round_id
      t.datetime :gametime
      t.integer :stadium_id
      t.integer :team_one
      t.integer :team_two
      t.integer :goals_team_one, :default => 0
      t.integer :goals_team_two, :default => 0
      
      t.string :status
      t.timestamps
    end
  end
end
