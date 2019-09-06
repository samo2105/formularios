class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :value, numericality: { only_integer: true, greater_than: 0}
  validates :discount, numericality: { only_integer: true, less_than_or_equal_to: 40, greater_than_or_equal_to: 0}
end
