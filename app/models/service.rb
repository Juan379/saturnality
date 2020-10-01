class Service < ApplicationRecord
  has_many :contracts
  has_many :parties, through: :contracts
  has_many :coverages
  has_many :comunas, through: :coverages
end
