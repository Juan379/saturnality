# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comuna, type: :model do
  context 'When valid names are given to crate a Comuna' do
    it 'is created correctly' do
      comuna = described_class.new(name: 'San Antonio')
      expect(comuna).to be_valid
    end
  end

  context 'When invalid names are given to create a Comuna' do
    it 'does not crate the Comuna because it has no name' do
      comuna = described_class.new
      expect(comuna).not_to be_valid
    end

    it 'does not crate the Comuna because it has an empty name' do
      comuna = described_class.new(name: ' ')
      expect(comuna).not_to be_valid
    end
  end
end
