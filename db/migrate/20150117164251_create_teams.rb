class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.string :type
      t.string :city

      t.timestamps
    end
  end
end
