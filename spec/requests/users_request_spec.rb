# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = User.create(email: 'testuser@gmail.com', name: 'test', age: 18,
                         phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')

      get user_path(user.id)
      expect(response).to render_template(:show)
    end
  end
end
