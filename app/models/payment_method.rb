class PaymentMethod < ApplicationRecord
  belongs_to :venue

  validates :name, presence: true

  enum payment: {paypal: 1, directly: 2, banking: 3}
end
