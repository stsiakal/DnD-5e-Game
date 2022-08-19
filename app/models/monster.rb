class Monster < ApplicationRecord
  self.inheritance_column = 'kind_of_monster'
end
