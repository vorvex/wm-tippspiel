class CreateTipps < ActiveRecord::Migration[5.2]
  def change
    create_table :tipps do |t|
      t.integer :gamer_id
      t.integer :game_id
      t.integer :goals_one
      t.integer :goals_two
      
      t.timestamps
    end
  end
end
