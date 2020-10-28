# frozen_string_literal: true

class Coverage < ApplicationRecord
  resourcify
  belongs_to :service
  belongs_to :comuna
end
