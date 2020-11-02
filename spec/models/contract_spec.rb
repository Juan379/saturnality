# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contract, type: :model do

context 'When a service and valid parties are recieved' do
    it 'is created correctly' do
        user1 = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        user2 = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
        party = Party.new(description: 'This is the best party ever',
                                    address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                    search: true, user: user1, comuna: comuna)
        service = Service.new(name: 'CleaningService',
                                    description: 'The best cleaning service available',
                                    capacity: 20, price: 50_000, rating: 3.0, user: user2)
        contract = Contract.new(service: service, party: party)
        expect(contract).to be_valid
    end
    end
    
end
