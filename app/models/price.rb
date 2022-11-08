class Price < ApplicationRecord
  CURRENCIES = ['USD', 'GBP', 'EUR', 'JOD', 'JPY'].freeze

  belongs_to :priceable, polymorphic: true

  validates_presence_of :price, :currency
  validates :currency, uniqueness: { scope: [:priceable_id, :priceable_type] }

  validate :acceptable_currencies

  def acceptable_currencies
    errors.add(:base, "Currency is not acceptable.") unless self.currency.in?(CURRENCIES)
  end
end
