# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Servicereview, type: :model do
  describe 'creation' do
    it 'is not correctly' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = Service.new(name: 'CleaningService',
                            description: 'The best cleaning service available',
                            capacity: 20, price: 50_000, rating: 3.0, user: user)
      ser_rev = described_class.new(id: 1, body: 'wen carrete perro', user: user, service: service)
      expect(ser_rev).to be_valid
    end

    it 'is not created correctly without body' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = Service.new(name: 'CleaningService',
                            description: 'The best cleaning service available',
                            capacity: 20, price: 50_000, rating: 3.0, user: user)
      ser_rev = described_class.new(id: 1, user: user, service: service)
      expect(ser_rev).not_to be_valid
    end

    it 'is not created correctly without a user' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = Service.new(name: 'CleaningService',
                            description: 'The best cleaning service available',
                            capacity: 20, price: 50_000, rating: 3.0, user: user)
      ser_rev = described_class.new(id: 1, body: 'wen carrete perro', service: service)
      expect(ser_rev).not_to be_valid
    end

    it 'is not created correctly without a service' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                      password: 'asdffgg', password_confirmation: 'asdffgg')
      service = Service.new(name: 'CleaningService',
                            description: 'The best cleaning service available',
                            capacity: 20, price: 50_000, rating: 3.0, user: user)
      ser_rev = described_class.new(id: 1, body: 'wen carrete perro', user: user)
      expect(ser_rev).not_to be_valid
    end
  end
end
