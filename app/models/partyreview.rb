# frozen_string_literal: true

class Partyreview < ApplicationRecord
  belongs_to :user
  belongs_to :party
  validates :body, presence: true
end
