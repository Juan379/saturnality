# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  resourcify
  self.abstract_class = true
end
