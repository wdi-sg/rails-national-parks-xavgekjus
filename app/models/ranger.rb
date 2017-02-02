class Ranger < ApplicationRecord
  has_and_belongs_to_many :parks, inverse_of: :park

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
end
