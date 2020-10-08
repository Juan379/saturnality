class Service < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_many :parties, through: :contracts, dependent: :delete_all
  has_many :coverages
  has_many :comunas, through: :coverages, dependent: :delete_all
  # validates :name, :description, : :presence => true
  validates_presence_of :name, :description, :capacity, :price, :rating

end
