class Park < ApplicationRecord
  COUNTRY_CODES = ['CA', 'US']

  validates :name, presence: true
  validates :country, presence: true, inclusion: { in: COUNTRY_CODES }
end
