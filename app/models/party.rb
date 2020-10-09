class Party < ApplicationRecord
  belongs_to :comuna
  belongs_to :user
  has_many :contracts
  has_many :services, through: :contracts, dependent: :delete_all
  validates :title, :description, :address, :capacity, :cost, :search, presence: true
end
