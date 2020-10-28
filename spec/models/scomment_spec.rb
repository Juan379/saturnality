# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scomment, type: :model do
  context 'when valid inputs are given to create a Service Comment' do
    it 'creates a Comment correctly' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comment = described_class.new(user: user, content: 'This is the best service ever')
      expect(comment).to be_valid
    end
  end

  context 'when invalid inputs are given to create a Service Comment' do
    it 'does not create a Service Comment without a User being linked to it' do
      comment = described_class.new(content: 'This is the best service ever')
      expect(comment).not_to be_valid
    end

    it 'does not create a Service Comment without content' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comment = described_class.new(user: user)
      expect(comment).not_to be_valid
    end
  end
end
