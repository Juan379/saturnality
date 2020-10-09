require 'rails_helper'

RSpec.describe Comuna, type: :model do
  it "should be created correctly" do
    comuna = Comuna.new(:name => "San Antonio")
    expect(comuna).to be_valid
  end
  
  context "When invalid names are given to create a Comuna" do

    it "shouldn't crate the Comuna because it has no name" do
      comuna = Comuna.new()
      expect(comuna).not_to be_valid
    end

    it "shouldn't crate the Comuna because it has an empty name" do
      comuna = Comuna.new(:name => " ")
      expect(comuna).not_to be_valid
    end
  end
end