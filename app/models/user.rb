# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  rolify
  # include Authority::UserAbilities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :parties, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :servicereviews, dependent: :destroy
  has_many :partyreviews, dependent: :destroy
  has_many :interesteds
  has_many :parties, through: :interesteds, dependent: :delete_all
  has_many :attendees
  has_many :parties, through: :attendees, dependent: :delete_all
  validates :name, presence: true
  validates :age, presence: true
  validates :phone, presence: true
end
