class Feeding < ApplicationRecord
  belongs_to :food
  belongs_to :park

  validates :amount, presence: true
  validates :time, presence: true
  validates :duck_count, presence: true
end
