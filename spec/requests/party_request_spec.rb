# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Parties', type: :request do
  context 'creation of a Party' do
    it 'creates a Party and reflect that on index page' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.create(title: 'The best', description: 'This is the best party ever',
                           address: 'Roble drive 123', capacity: 23, cost: 25_000,
                           search: true, user: user, comuna: comuna)
      expect(party).to be_valid
      get parties_path
      expect(response).to be_successful
      expect(response.body).to include('The best')
      get '/parties/' + party.id.to_s
      expect(response).to render_template(:show)
      get edit_party_path
      expect(response).to be_successful
      party.update(title: 'Hola')
      expect(party.title).to eq('Hola')
      expect do
        subject
        party.reload
        party.title = 'new@ya.com'
      end.to change(party, :title).from('Hola').to('new@ya.com')
    end
  end

  context 'rendering of different views' do
    it 'renders the index view' do
      get '/parties'
      expect(response).to render_template(:index)
    end

    it 'returns successful request of the index view' do
      get '/parties'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the new view' do
      get '/parties/new'
      expect(response).to render_template(:new)
    end

    it 'returns successful request of the new view' do
      get '/parties/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /parties' do
    it 'create a new party' do
      u1 = User.create(email: 'juan@gmail.com', name: 'Juan', age: 21, phone: '123123', password: 'qwerty')
      c1 = Comuna.create(name: 'Lo Barnechea')
      post '/parties', params: { party: { title: 'Hola', description: 'Hola', address: 'Hola', capacity: '25', cost: '25' }, comuna: { id: c1.id } }
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE /parties' do
    it 'create a new party' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.create(title: 'The best', description: 'This is the best party ever',
                           address: 'Roble drive 123', capacity: 23, cost: 25_000,
                           search: true, user: user, comuna: comuna)
      delete '/parties/' + party.id.to_s
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE /parties' do
    it 'create a new party' do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comuna = Comuna.new(name: 'San Antonio')
      party = Party.create(title: 'The best', description: 'This is the best party ever',
                           address: 'Roble drive 123', capacity: 23, cost: 25_000,
                           search: true, user: user, comuna: comuna)
      post "/parties/#{party.id}/close_and_notify", params: { id: party.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
