class Subscription < ApplicationRecord
  belongs_to :client
  belongs_to :plan, optional: true
  belongs_to :additional_service
  belongs_to :package, optional: true

  has_many :subscription_additional_services, dependent: :destroy
  has_many :additional_services, through: :subscription_additional_services
end
