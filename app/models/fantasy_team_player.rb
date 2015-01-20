class FantasyTeamPlayer < ActiveRecord::Base
  #Validations
  validates_associated :fantasy_team
  validate :check_money_limit

  #Associations
  belongs_to :player
  belongs_to :fantasy_team, foreign_key: 'team_id'

  #Callbacks
  before_save :get_player_type_from_player
  #Should be a validation , just made it an callback to ease out thing
  after_create :check_formation

  private
    def get_player_type_from_player
      self.player_type = player.type
    end

    def check_money_limit
      #Add caching to improve query performance
      if fantasy_team.players.sum(:cost) + player.cost > FantasyTeam::MONEY_LIMIT
        errors.add(:insuffecient_money, 'Sorry !! You are out of Money!!')
      end
    end

    def check_formation
      current_formation = [fantasy_team.batsmen.count, fantasy_team.bowlers.count, fantasy_team.all_rounders.count, fantasy_team.wicket_keepers.count]
      formation_matched = check_in_formation?(current_formation)
      unless formation_matched
        errors.add(:formation_mismatch, 'Formation not matching')
        raise ActiveRecord::Rollback
      end
    end

    def check_in_formation?(current_formation)
      #The logic is for current formations only and will change accordingly
      FantasyTeam::FORMATIONS.any? do |formation|
        satisfy_formation = true
        current_formation.each_with_index do |individual_number, index|
          if individual_number > formation[index]
            satisfy_formation = false
            break
          end
        end
        satisfy_formation
      end
    end
end
