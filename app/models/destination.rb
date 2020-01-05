class Destination < ActiveRecord::Base
    has_many :tours
    has_many :trips
    has_many :users, through: :tours
    #validates :country, :city, length: { minimum: 3 }
    #validates :country, :city, presence: true


end
