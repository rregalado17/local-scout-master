class Destination < ActiveRecord::Base
    has_many :tours
    has_many :trips
    has_many :users, through: :tours
    validates :city, presence: true
end
