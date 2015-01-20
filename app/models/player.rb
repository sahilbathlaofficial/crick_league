class Player < ActiveRecord::Base

  #Validation
  validates :name, :type, :cost, presence: true

  #Associations
  has_many :profiles, class_name: 'FantasyTeamPlayer', foreign_key: 'player_id', dependent: :destroy
  has_many :fantasy_teams, through: :profiles
  belongs_to :ipl_team, foreign_key: 'team_id'
end
