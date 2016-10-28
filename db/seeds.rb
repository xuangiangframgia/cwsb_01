# booking types
BookingType.create name: "DAY"
BookingType.create name: "WEEK"
BookingType.create name: "MONTH"

# create_user
user = User.new name: "Test User", email: "testuser@gmail.com",
  password: "12345678", password_confirmation: "12345678"
user.skip_confirmation!
user.save!

# create_address
address1 = Address.create! details: "Parkson Da Nang, Hung Vuong,
  Vinh Trung, Da Nang, Vietnam"
address2 = Address.create! details: "Hotel Novotel Danang Premier Han River,
  Da Nang, Vietnam"

venue1 = Venue.new name: Faker::Name.name,
  description: Faker::Lorem.paragraph, address: address1

image1 = Image.new picture: Rack::Test::UploadedFile.new(File.join(Rails.root, "public", "images",
  "spaces", "space1.jpg"))
image2 = Image.new picture: Rack::Test::UploadedFile.new(File.join(Rails.root, "public", "images",
  "spaces", "space1.jpg"))
image3 = Image.new picture: Rack::Test::UploadedFile.new(File.join(Rails.root, "public", "images",
  "spaces", "space1.jpg"))
image4 = Image.new picture: Rack::Test::UploadedFile.new(File.join(Rails.root, "public", "images",
  "spaces", "space1.jpg"))

space1 = Space.new space_type: :prive_office, size: 10, capicity: 4,
  quantity: 2, description: Faker::Lorem.paragraph
space1.images << image1
venue1.spaces << space1

space2 = Space.new space_type: :desk, size: 10, capicity: 4, quantity: 2,
  description: Faker::Lorem.paragraph
space2.images << image2
venue1.spaces << space2
venue1.save

venue2 = Venue.new name: Faker::Name.name,
  description: Faker::Lorem.paragraph, address: address2
space3 = Space.new space_type: :desk, size: 10, capicity: 4, quantity: 2,
  description: Faker::Lorem.paragraph
space3.images << image3
space3.images << image4
venue2.spaces << space3

venue2.save

# create_working_time
from = Time.zone.local(1, 1, 1, 8, 00, 00)
to = Time.zone.local(1, 1, 1, 18, 00, 00)

Venue.all.each do |venue|
  WorkingTime.day_in_weeks.each do |date|
    WorkingTime.create venue: venue, day_in_week: date.second, status: :open,
      working_from: from, working_to: to
  end
end

#create_price_for_space
Price.all.destroy_all
Space.all.each do |space|
  BookingType.all.each do |booking_type|
    price = 0
    case booking_type.name
    when "DAY"
      price = 50000
    when "WEEK"
      price = 280000
    when "MONTH"
      price = 3000000
    end
    Price.create space: space, booking_type: booking_type, price: price
  end
end
