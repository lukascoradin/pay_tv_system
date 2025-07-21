class Package < ApplicationRecord
  belongs_to :plan

  has_many :packages_additional_services, dependent: :destroy
  has_many :additional_services, through: :packages_additional_services

  validates :name, presence: true
  validates :plan, presence: true
  validates :price, numericality: true, allow_nil: true

  validate :must_have_additional_service

  before_validation :set_price_if_nil

  private

  def must_have_additional_service
    if additional_services.empty?
      errors.add(:additional_services, "Must include at least one service")
    end
  end

  def set_price_if_nil
    if price.blank?
      self.price = plan.price + additional_services.sum(&:price)
    end
  end
end
