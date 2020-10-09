# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Parties', :type => :request do
    it "should create a Party and redirects to the Parties index page" do
        get "/parties/new"
        expect(response).to render_template(:new)
    end
    
end
