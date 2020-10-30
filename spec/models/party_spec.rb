# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Party, type: :model do
  context 'when valid inputs are given to create a Party' do
    it 'creates the Party correctly' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                  address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                  search: true, user: user, comuna: comuna)
      expect(party).to be_valid
    end

    context 'when invalid inputs are given to create a Party' do
      it 'does not create a Party without it being linked to a User' do
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                    address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                    search: true, comuna: comuna)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without it being linked to a Comuna' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                    address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                    search: true, user: user)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without a title' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(description: 'This is the best party ever',
                                    address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                    search: true, user: user, comuna: comuna)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without a description' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(title: 'The best', address: 'Roble drive 123', capacity: 23,
                                    cost: 25_000, search: true, user: user, comuna: comuna)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without an address' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                    capacity: 23, cost: 25_000, search: true,
                                    user: user, comuna: comuna)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without a capacity' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                    address: 'Roble drive 123', cost: 25_000, search: true,
                                    user: user, comuna: comuna)
        expect(party).not_to be_valid
      end

      it 'does not create a Party without a cost' do
        user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = described_class.new(title: 'The best', description: 'This is the best party ever',
                                    address: 'Roble drive 123', capacity: 23, search: true,
                                    user: user, comuna: comuna)
        expect(party).not_to be_valid
      end
    end
  end
end
