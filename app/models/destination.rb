class Order < ApplicationRecord
    belongs_to :tour
    belongs_to :user 
    #validations

end
