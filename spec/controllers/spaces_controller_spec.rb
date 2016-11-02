require "rails_helper"

RSpec.describe SpacesController, type: :controller do
  let(:space) do
    mock_model Space, capicity: 5, quantity: 5, description: "abcd",
      space_type: 1, size: 100
  end
  before(:each) do
    login_with create(:user)
  end

  describe "GET #new" do
    it "should create space" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    it "should created space" do
      post :create, space: {capicity: space}
      response.should redirect_to venue_spaces_path
    end

    it "don't created space" do
      post :create, space: {capicity: nil}
      expect(flash[:warning]).not_to be_empty
      expect(response).to render_template "new"
    end
  end
end
