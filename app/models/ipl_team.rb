class IplTeam < Team
  #Validations
  validates :city, presence: true

  #Associations
  has_many :players, dependent: :destroy, foreign_key: 'team_id'
end