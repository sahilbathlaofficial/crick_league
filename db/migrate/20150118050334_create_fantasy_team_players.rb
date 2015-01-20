class CreateFantasyTeamPlayers < ActiveRecord::Migration
  def change
    create_table :fantasy_team_players do |t|
      t.integer :player_id
      t.integer :team_id
      t.string :player_type

      t.timestamps
    end
  end
end
