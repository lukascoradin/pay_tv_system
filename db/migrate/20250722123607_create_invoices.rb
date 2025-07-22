class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :subscription, null: false, foreign_key: true
      t.date :issued_at, null: false
      t.date :due_date, null: false
      t.references :booklet, foreign_key: true
      t.decimal :value, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
