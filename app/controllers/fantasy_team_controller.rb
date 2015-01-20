class FantasyTeamController < ApplicationController
  before_filter :load_team

  #Display the fantasy team, the single page UI for out application
  def show
    @fantasy_players = @team.fantasy_team_players.includes(:player)
    @players = @team.players
    @batsmen = Batsman.all # or Batsman.limit(n) in case we want limited batsmen
    @bowlers = Bowler.all
    @wicket_keepers = WicketKeeper.all
    @all_rounders = AllRounder.all
    @player_ids = @players.pluck(:id)
  end

  private
    def load_team
      #Assuming we will always get the team or else handle case if team not found
      @team = current_user.fantasy_team
    end
end
