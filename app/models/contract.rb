class Contract < ApplicationRecord
  belongs_to :party
  belongs_to :service
end
