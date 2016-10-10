require "rails_helper"

RSpec.describe Venue, type: :model do
  context "associations" do
    it {is_expected.to have_one :address}
    it {is_expected.to have_many :images}
    it {is_expected.to have_many :roles}
    it {is_expected.to have_many :users}
    it {is_expected.to have_many :amenities}
    it {is_expected.to have_many :reviews}
    it {is_expected.to have_many :spaces}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :description}
  end
end
