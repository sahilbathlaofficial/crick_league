Rails.application.routes.draw do
  resource :fantasy_team, only: [:show]
  resources :fantasy_team_players, only: [:create, :destroy]
  root 'fantasy_team#show'
end
