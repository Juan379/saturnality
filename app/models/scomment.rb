# frozen_string_literal: true

class Scomment < ApplicationRecord
  resourcify
  belongs_to :user
  validates :content, presence: true
end
