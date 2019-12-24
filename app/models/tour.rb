class Tour < ApplicationRecord
    has_many :destinations 
    #has_many :users through :destinations 
    validates :title, format: { without: /[0-9]/, message: "does not allow numbers" }
end
