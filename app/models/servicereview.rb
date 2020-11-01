# frozen_string_literal: true

class Servicereview < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :body, presence: true
end
