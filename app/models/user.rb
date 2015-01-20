class User < ActiveRecord::Base
  #Validations
  validates :name, presence: true

  #Associations
  has_one :fantasy_team, dependent: :destroy

  #Callbacks
  after_create :create_fantasy_team_for_user


  private
    def create_fantasy_team_for_user
      create_fantasy_team(name: 'Test Team')
    end
end
