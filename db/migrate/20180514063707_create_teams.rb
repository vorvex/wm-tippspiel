class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :position
      t.integer :round_id
      t.string :country, :default => ""
      t.string :flag_url, :default => ""
      t.integer :group_id
      t.integer :games, :default => 0
      t.integer :wins, :default => 0
      t.integer :draws, :default => 0
      t.integer :losses, :default => 0
      t.integer :goals, :default => 0
      t.integer :goals_allowed, :default => 0
      t.integer :points, :default => 0
      t.integer :place, :default => 0
      t.string :status
      
      t.timestamps
    end
  end
end
