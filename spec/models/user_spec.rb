require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'can be created' do
      user = User.create(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      
      expect(user).to be_valid
    end
    it 'can be created and save email' do
      user = User.create(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      
      expect(user.email).to eq("testuser@gmail.com")
    end
    it 'can be created and save name' do
      user = User.create(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      
      expect(user.name).to eq("test")
    end
    it 'can be created and save age' do
      user = User.create(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      
      expect(user.age).to eq(18)
    end
    it 'can be created and save phone' do
      user = User.create(email: "testuser@gmail.com", name:"test", age: 18, phone:"123456789", password: "asdffgg", password_confirmation: "asdffgg")
      
      expect(user.phone).to eq("123456789")
    end
  end
end