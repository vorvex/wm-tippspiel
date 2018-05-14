class AddUsersToTipp < ActiveRecord::Migration[5.2]
  def change
    add_reference :tipps, :user, foreign_key: true
  end
end
