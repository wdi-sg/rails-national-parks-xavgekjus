class Park < ApplicationRecord
  has_and_belongs_to_many :rangers, inverse_of: :park
  accepts_nested_attributes_for :rangers, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
end
