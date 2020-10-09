# frozen_string_literal: true

class Comuna < ApplicationRecord
  has_many :parties, dependent: :destroy
  has_many :coverages
  has_many :services, through: :coverages, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
end