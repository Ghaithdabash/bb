class Lense < ApplicationRecord
  has_many :prices, as: :priceable, dependent: :destroy

  validates_presence_of :color

  enum prescription_type: [ :fashion, :single_vision, :varifocal ]
  enum lens_type: [ :classic, :blue_light, :transition ]

  accepts_nested_attributes_for :prices, allow_destroy: true
end
