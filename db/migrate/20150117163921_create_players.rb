class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :type
      t.float :cost
      t.integer :team_id

      t.timestamps
    end
  end
end
