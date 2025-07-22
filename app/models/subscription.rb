class Subscription < ApplicationRecord
  belongs_to :client
  belongs_to :plan, optional: true
  belongs_to :package, optional: true

  has_many :subscription_additional_services, dependent: :destroy
  has_many :additional_services, through: :subscription_additional_services
  has_many :billing_accounts, dependent: :destroy
  has_many :invoices

  has_one :booklet

  validate :must_have_plan_or_package
  validate :addons_only_with_plan

  private

  def must_have_plan_or_package
    if plan.present? && package.present?
      errors.add(:base, "Subscription should only have a plan or package, not both.")
    elsif plan.blank? && package.blank?
      errors.add(:base, "Subscription must have at least one plan or package")
    end
  end

  def addons_only_with_plan
    if package.present? && additional_services.any?
      errors.add(:base, "Additional services are not allowed when a package is selected")
    end
  end
end
