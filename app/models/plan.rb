class Plan < ApplicationRecord
  has_many :packages
  has_many :subscriptions
  has_many :billing_accounts, as: :billable

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
