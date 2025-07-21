class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :client
  belongs_to :additional_service
  belongs_to :package

end
