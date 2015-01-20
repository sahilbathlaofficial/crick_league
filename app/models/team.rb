class Team < ActiveRecord::Base
  #Validations
  validates :name, :type, presence: true
end