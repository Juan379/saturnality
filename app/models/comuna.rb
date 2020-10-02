class Comuna < ApplicationRecord
  has_many :parties
  has_many :coverages
  has_many :services, through: :coverages
  # validates :name, uniqueness: { case_sensitive: false, message: "This name has already been taken" }
end
