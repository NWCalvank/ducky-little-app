class Park < ApplicationRecord
  COUNTRY_CODES = %w(AU CA JP MX PR US)

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true
  validates :country, presence: true, inclusion: { in: COUNTRY_CODES }
end
