class FantasyTeamPlayersController < ApplicationController

  before_filter :load_team, only: :create
  before_filter :load_fantasy_team_player, only: :destroy

  #Add new fantasy team player
  def create
    @fantasy_team_player = FantasyTeamPlayer.create(team_id: @team.id, player_id: params[:player_id])
    unless @fantasy_team_player.new_record?
      render json: @fantasy_team_player, status: :ok, include: [:player]
    else
      render json: error_messages_on_create, status: :unprocessable_entity
    end
  end

  #Remove fantasy team player from team
  def destroy
    if @fantasy_team_player.destroy
      render json: @fantasy_team_player, status: :ok, include: [:player]
    else
      render json: { message: 'could not delete' }, status: :unprocessable_entity
    end
  end

  private
    def load_team
      #Assuming we will always get the team or else handle case if team not found
      @team = current_user.fantasy_team
    end

    def load_fantasy_team_player
      #Assuming we will always get the player or else handle case if player not found
      @fantasy_team_player = FantasyTeamPlayer.find_by(id: params[:id])
    end

    def error_messages_on_create
      @fantasy_team_player.fantasy_team.errors.messages.merge(@fantasy_team_player.errors.messages)
    end
end
