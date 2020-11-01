# frozen_string_literal: true

class Interested < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :offer, presence: true
end
