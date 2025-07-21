class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :plan, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :additional_service, foreign_key: true
      t.references :package, foreign_key: true
      t.timestamps
    end

    add_index :subscriptions, [ :client_id, :plan_id, :package_id, :additional_service_id ], unique: true
  end
end
