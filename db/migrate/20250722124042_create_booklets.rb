class CreateBooklets < ActiveRecord::Migration[8.0]
  def change
    create_table :booklets do |t|
      t.references :subscription, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.decimal :value, precision: 10, scale: 2, null: false, default: 0.0

      t.timestamps
    end
  end
end
