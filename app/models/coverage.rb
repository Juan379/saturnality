# frozen_string_literal: true

class Coverage < ApplicationRecord
  belongs_to :service
  belongs_to :comuna
end
