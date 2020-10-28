# frozen_string_literal: true

class Contract < ApplicationRecord
  resourcify
  belongs_to :party
  belongs_to :service
end
