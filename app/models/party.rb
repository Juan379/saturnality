# frozen_string_literal: true

class Party < ApplicationRecord
  resourcify
  belongs_to :comuna
  belongs_to :user

  has_many :contracts
  has_many :services, through: :contracts, dependent: :delete_all

  has_many :partyreviews, dependent: :destroy
  
  has_many :interesteds
  has_many :users, through: :interesteds, dependent: :delete_all
  
  has_many :attendees
  has_many :users, through: :attendees, dependent: :delete_all
  
  validates :title, :description, :address, :capacity, :cost, presence: true
end
