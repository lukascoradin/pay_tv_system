class CreatePackageAdditionalServices < ActiveRecord::Migration[8.0]
  def change
    create_table :packages_additional_services do |t|
      t.references :package, null: false, foreign_key: true
      t.references :additional_service, null: false, foreign_key: true
      t.timestamps
    end

    add_index :packages_additional_services, [ :package_id, :additional_service_id ], unique: true
  end
end
