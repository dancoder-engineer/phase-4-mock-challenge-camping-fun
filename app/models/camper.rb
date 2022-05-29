class Camper < ApplicationRecord
    validates :name, presence: true
    validate :must_be_kid
   # validates :age, numericality: { in: 8..18 }
    has_many :signups
    has_many :activities, through: :signups

    def must_be_kid
        unless age > 7 && age < 19
            errors.add(:age, "They're not in the proper age range.")
        end
    end
end
