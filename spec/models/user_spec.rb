# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'is created correctly' do
      user = described_class.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                                 phone: 123_456_789, password: 'asdffgg',
                                 password_confirmation: 'asdffgg')
      expect(user).to be_valid
    end

    it 'is created and save email' do
      user = described_class.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                                 phone: 123_456_789, password: 'asdffgg',
                                 password_confirmation: 'asdffgg')
      expect(user.email).to eq('testuser@gmail.com')
    end

    it 'is created and save name' do
      user = described_class.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                                 phone: 123_456_789, password: 'asdffgg',
                                 password_confirmation: 'asdffgg')
      expect(user.name).to eq('test')
    end

    it 'is created and save age' do
      user = described_class.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                                 phone: 123_456_789, password: 'asdffgg',
                                 password_confirmation: 'asdffgg')
      expect(user.age).to eq(18)
    end

    it 'is created and save phone' do
      user = described_class.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                                 phone: '123456789', password: 'asdffgg',
                                 password_confirmation: 'asdffgg')
      expect(user.phone).to eq('123456789')
    end

    context 'when invalid inputs are given to create a User' do
      it 'is not created without name' do
        user = described_class.new(email: 'testuser@gmail.com', age: 18, phone: '123456789',
                                   password: 'asdffgg', password_confirmation: 'asdffgg')
        expect(user).not_to be_valid
      end

      it 'is not created without phone' do
        user = described_class.new(email: 'testuser@gmail.com', age: 18, name: 'test', password:
                                  'asdffgg', password_confirmation: 'asdffgg')
        expect(user).not_to be_valid
      end

      it 'is not created without age' do
        user = described_class.new(email: 'testuser@gmail.com', phone: '18',
                                   name: 'test', password: 'asdffgg',
                                   password_confirmation: 'asdffgg')
        expect(user).not_to be_valid
      end
    end
  end
end
