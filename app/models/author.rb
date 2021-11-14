class Author < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :homepage, presence: true #03: validation declares that a first_name value must be present

    def name # höchst unsicher (03) - weiß nicht, ob ich das brauche?!
        full_name = self.first_name + " " + self.last_name
        return full_name
    end
end