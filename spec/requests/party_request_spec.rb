# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Parties', :type => :request do
    context "creation of a Party" do 
        it "should create a Party and reflect that on index page" do
            user = User.new(email: 'testuser@gmail.com', name: 'test', age: 18,
                            phone: 123_456_789, password: 'asdffgg', password_confirmation: 'asdffgg')
            comuna = Comuna.new(name: 'San Antonio')
            party = Party.create(title: 'The best', description: 'This is the best party ever',
                                        address: 'Roble drive 123', capacity: 23, cost: 25_000,
                                        search: true, user: user, comuna: comuna)
            get parties_path
            expect(response).to be_successful
            expect(response.body).to include("The best")
        end
    end

    context "rendering of different views" do
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
end
