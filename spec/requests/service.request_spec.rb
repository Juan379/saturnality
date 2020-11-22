# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Services', type: :request do
  it 'creates a Service and reflect that on index page' do
    user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
                    password: 'asdffgg', password_confirmation: 'asdffgg')
    comuna = Comuna.new(name: 'San Antonio')
    service = Service.create(name: 'CleaningService',
                             description: 'The best cleaning service available',
                             capacity: 20, price: 50_000, rating: 3.0, user: user )
    get services_path
    expect(response).to be_successful
    get new_service_path
    expect(response).to be_successful
    # expect(response.body).to include('CleaningService')
    # get service_path(service)
    # expect(response).to be_successful
  end

  context 'rendering of different views' do
    it 'renders the index view' do
      get '/services'
      expect(response).to render_template(:index)
    end

    it 'returns successful request of the index view' do
      get '/services'
      expect(response).to have_http_status(:ok)
    end

    it 'returns successful request of the index view' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18, phone: 123_456_789,
        password: 'asdffgg', password_confirmation: 'asdffgg')
        comuna = Comuna.new(name: 'San Antonio')
      # post '/services', params: {service: { name: 'Hola', description: 'Hola', capacity: 'Hola', rating: '3.0', price: '25', user_id: user.id, comuna: comuna }}
    end
  end
end
