require 'rails_helper'

RSpec.describe "Scomments", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/scomments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/scomments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/scomments/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/scomments/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
