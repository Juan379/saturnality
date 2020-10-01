class Comuna < ApplicationRecord
  has_many :parties
  has_many :coverages
  has_many :services, through: :coverages
end
