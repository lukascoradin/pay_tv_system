class AdditionalService < ApplicationRecord
  has_many :subscription_additional_services
  has_many :subscriptions, through: :subscription_additional_services
  has_many :packages_additional_services, dependent: :destroy
  has_many :packages, through: :packages_additional_services
  has_many :subscriptions

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
