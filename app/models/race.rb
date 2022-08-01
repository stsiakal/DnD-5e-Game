class Race < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :character
end

#  :index
#  :name
#  :speed
# t.text :ability_bonuses
#  :size
# t.text :size_description
# t.text :starting_proficiencies
#  :starting_proficiency_options
# t.text :languages
# t.text :language_description
# t.text :traits
# t.text :subraces
