class Park < ApplicationRecord

  validates_presence_of :name, :description, :picture  #everything we want to validate here. Shortcut rather than having to repeat presence of in every line
  validates :name, length: {maximum: 10}  #Validating name field here
  validates :description, length: {maximum: 20}  #Validating name field here
end
