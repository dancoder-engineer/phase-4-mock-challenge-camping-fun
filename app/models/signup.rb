class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity
    validates :time, numericality: { less_than: 24 }



end

