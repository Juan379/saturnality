class Party < ApplicationRecord
  belongs_to :comuna
  has_many :contracts
  has_many :services, through: :contracts
end
