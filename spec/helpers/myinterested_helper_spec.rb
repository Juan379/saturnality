require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MyinterestedHelper. For example:
#
# describe MyinterestedHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PartiesHelper, type: :helper do
  
  describe "#metodo2" do
    it "returns true" do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
        phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
comuna = Comuna.new(name: 'San Antonio')
party = Party.create(title: 'The best', description: 'This is the best party ever',
             address: 'Roble drive 123', capacity: 23, cost: 25_000,
             search: true, user: user, comuna: comuna)
      expect(helper.how_much_interesteds(party)).to equal(0)
    end
end

describe "#metodo3" do
  it "returns true" do
    user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
comuna = Comuna.new(name: 'San Antonio')
party = Party.create(title: 'The best', description: 'This is the best party ever',
           address: 'Roble drive 123', capacity: 23, cost: 25_000,
           search: true, user: user, comuna: comuna)
    expect(helper.how_much_money(party)).to equal(0)
  end
end

describe "#metodo1" do
  it "returns true" do
    user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
comuna = Comuna.new(name: 'San Antonio')
party = Party.create(title: 'The best', description: 'This is the best party ever',
           address: 'Roble drive 123', capacity: 23, cost: 25_000,
           search: true, user: user, comuna: comuna)
    expect(helper.user_is_interested(user, party)).to be(false)
  end
end


end
