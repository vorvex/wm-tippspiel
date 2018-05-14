class AddShortnameToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :shortname, :string
  end
end
