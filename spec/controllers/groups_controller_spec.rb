require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show_one" do
    it "returns http success" do
      get :show_one
      expect(response).to have_http_status(:success)
    end
  end

end
