# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'when valid inputs are given to create a Service' do
    it 'creates the service correctly' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: 3.0, user: user)
      expect(service).to be_valid
    end
  end

  context 'when invalid inputs are given to create a Service' do
    it "does not create a Service if it's not linked to a User" do
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: 3.0)
      expect(service).not_to be_valid
    end

    it 'does not create a Service the rating is higher than 5.0' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: 5.1, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service the rating is lower than 1.0' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: -1.0, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service without a name' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: 3.0, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service without a description' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService', capacity: 20,
                                    price: 50_000, rating: 3.0, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service without a capacity' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    rating: 3.0, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service without a price' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, rating: 3.0, user: user)
      expect(service).not_to be_valid
    end

    it 'does not create a Service without a rating' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = described_class.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, user: user)
      expect(service).not_to be_valid
    end
  end
end
