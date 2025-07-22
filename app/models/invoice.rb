class Invoice < ApplicationRecord
  belongs_to :subscription
  belongs_to :booklet, optional: true
  
  has_many :billing_accounts
end