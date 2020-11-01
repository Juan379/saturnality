# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Partyreview, type: :model do
  describe 'creation' do
    it 'is created correctly' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.new(title: 'The best', description: 'This is the best party ever',
                        address: 'Roble drive 123', capacity: 23, cost: 25_000,
                        search: true, user: user, comuna: comuna)
      part_rev = described_class.new(id: 1, body: 'wen carrete perro', user: user, party: party)
      expect(part_rev).to be_valid
    end

    it 'is dosent created correctly without a body' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.new(title: 'The best', description: 'This is the best party ever',
                        address: 'Roble drive 123', capacity: 23, cost: 25_000,
                        search: true, user: user, comuna: comuna)
      part_rev = described_class.new(id: 1, user: user, party: party)
      expect(part_rev).not_to be_valid
    end

    it 'is dosent created correctly without a user' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.new(title: 'The best', description: 'This is the best party ever',
                        address: 'Roble drive 123', capacity: 23, cost: 25_000,
                        search: true, user: user, comuna: comuna)
      part_rev = described_class.new(id: 1, party: party)
      expect(part_rev).not_to be_valid
    end

    it 'is dosent created correctly without a party' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.new(title: 'The best', description: 'This is the best party ever',
                        address: 'Roble drive 123', capacity: 23, cost: 25_000,
                        search: true, user: user, comuna: comuna)
      part_rev = described_class.new(id: 1, user: user)
      expect(part_rev).not_to be_valid
    end
  end
end
