class Service < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_many :parties, through: :contracts, dependent: :delete_all
  has_many :coverages
  has_many :comunas, through: :coverages, dependent: :delete_all
  validates :name, :description, :capacity, :price, :rating, presence: true
  validates :rating, numericality: { only_float: true }, inclusion: { in: 1.0..5.0 }
end
