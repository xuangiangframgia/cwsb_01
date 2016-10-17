require "rails_helper"
include GeneralHelper

RSpec.describe Search::SpacesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
      xhr :get, :index
      expect(response).to render_template(:index)
    end

    context "check for gmaps rails" do
      let!(:address) {FactoryGirl.create :address}
      let!(:venue) {stub_model(Venue, name: "test", description: "test",
        address: address)}
      let(:addresses) {address}
      let(:hash) {mark_to_maps(addresses)}

      it "stubs :latitude" do
        expect(address.latitude).not_to be_nil
      end
      it "stubs :longitude" do
        expect(address.longitude).not_to be_nil
      end
      it "markers :latitude" do
        expect(hash.first.values.first).to eql address.latitude
      end
      it "markers :longitude" do
        expect(hash.first.values.second).to eql address.longitude
      end
    end
  end
end
