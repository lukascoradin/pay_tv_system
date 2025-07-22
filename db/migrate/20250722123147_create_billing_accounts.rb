class CreateBillingAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :billing_accounts do |t|
      t.references :subscription, null: false, foreign_key: true
      t.string :billable_type, null: false
      t.integer :billable_id, null: false
      t.date :due_date, null: false
      t.decimal :value, precision: 10, scale: 2, null: false
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
