class Package < ApplicationRecord
  belongs_to :plan

  has_many :subscriptions
  has_many :billing_accounts, as: :billable
  has_many :packages_additional_services, dependent: :destroy
  has_many :additional_services, through: :packages_additional_services

  validates :name, presence: true
  validates :plan, presence: true
  validates :price, numericality: true, allow_nil: true

  validate :must_have_additional_service

  before_validation :set_price

  private

  def must_have_additional_service
    if additional_services.empty?
      errors.add(:base, "Additional service must be included")
    end
  end

  def set_price
    if price.blank? && plan.present?
      self.price = plan.price + additional_services.sum(&:price)
    end
  end
end
