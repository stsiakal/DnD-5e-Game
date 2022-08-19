class Language < ApplicationRecord
  self.inheritance_column = 'kind_of_language'
end
