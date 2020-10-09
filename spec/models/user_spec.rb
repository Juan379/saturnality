require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'should be created correctly' do
      user = User.new(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      expect(user).to be_valid
    end

    it 'should be created and save email' do
      user = User.new(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      expect(user.email).to eq("testuser@gmail.com")
    end
    
    it 'should be created and save name' do
      user = User.new(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      expect(user.name).to eq("test")
    end

    it 'should be created and save age' do
      user = User.new(email: "testuser@gmail.com", name:"test", age: 18, phone:123456789, password: "asdffgg", password_confirmation: "asdffgg")
      expect(user.age).to eq(18)
    end
   
    it 'should be created and save phone' do
      user = User.new(email: "testuser@gmail.com", name:"test", age: 18, phone:"123456789", password: "asdffgg", password_confirmation: "asdffgg")
      expect(user.phone).to eq("123456789")
    end
    
    context "when invalid inputs are given to create a User" do

      it "shouldn't be created without name" do
        user = User.new(email: "testuser@gmail.com", age: 18, phone:"123456789", password: "asdffgg", password_confirmation: "asdffgg")
        expect(user).not_to be_valid
      end

      it "shouldn't be created without phone" do
        user = User.new(email: "testuser@gmail.com", age: 18, name:"test", password: "asdffgg", password_confirmation: "asdffgg")
        expect(user).not_to be_valid
      end

      it "shouldn't be created without age" do
        user = User.new(email: "testuser@gmail.com", phone: "18", name:"test", password: "asdffgg", password_confirmation: "asdffgg")
        expect(user).not_to be_valid
      end
    end
  end
end