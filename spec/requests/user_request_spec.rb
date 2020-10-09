# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe '/create' do
    it 'returns a succesful request' do
      get '/users/sign_up'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the sign in view' do
      get '/users/sign_up'
      expect(response).to render_template("users/registrations/new")
    end
  end
  describe '/sign_in' do
    it 'returns a succesful request' do
      get '/users/sign_in'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the sign in view' do
      get '/users/sign_in'
      expect(response).to render_template("users/sessions/new")
    end
  end
end