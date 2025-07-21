class AdditionalService < ApplicationRecord
  has_many :packages_additional_services, dependent: :destroy
  has_many :packages, through: :packages_additional_services

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
