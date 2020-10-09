# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :parties, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :scomments
  validates :name, presence: true
  validates :age, presence: true
  validates :phone, presence: true
end
