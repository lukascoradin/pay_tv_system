class BillingAccount < ApplicationRecord
  belongs_to :subscription
  belongs_to :billable, polymorphic: true
  belongs_to :invoice, optional: true

  validates :due_date, presence: true
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
