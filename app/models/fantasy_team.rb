class FantasyTeam < Team
  #Constants
  MONEY_LIMIT = 100
  MAX_PLAYERS = 8
  FORMATIONS = [3221, 3311, 4211]

  #Validations
  validate :check_max_players

  #Association
  has_many :fantasy_team_players, foreign_key: 'team_id'
  has_many :players, -> { readonly }, through: :fantasy_team_players, dependent: :destroy
  belongs_to :user

  #Read only records/association
  %w(Batsman Bowler WicketKeeper AllRounder).each do |player_type|
    define_method player_type.underscore.pluralize do
      players.where(type: player_type) 
    end
  end

  private 
    def check_max_players
      if fantasy_team_players.count >= MAX_PLAYERS
        errors.add(:team_full, 'Team is full, remove other players if you want to add more!!')
      end
    end
end