class Party < ApplicationRecord
  belongs_to :comuna
  belongs_to :user
  has_many :contracts
  has_many :services, through: :contracts, dependent: :delete_all
  validates_presence_of :title, :description, :address, :cost, :search

end
