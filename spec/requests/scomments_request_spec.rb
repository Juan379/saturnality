# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SComments', :type => :request do
    it "should create a Service Comment and reflect that on index page" do
      user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                      phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
      comment = Scomment.create(:user => user, :content => "This is the best service ever")
      get scomments_path
      expect(response).to be_successful
      expect(response.body).to include('test')
    end

    context "rendering of different views" do
      it 'renders the index view' do
          get '/scomments'
          expect(response).to render_template(:index)
      end

      it 'returns successful request of the index view' do
          get '/scomments'
          expect(response).to have_http_status(:ok)
      end

      it 'renders the new view' do
          get '/scomments/new'
          expect(response).to render_template(:new)
      end

      it 'returns successful request of the new view' do
          get '/scomments/new'
          expect(response).to have_http_status(:ok)
      end
    end
end