class CreateAdditionalServices < ActiveRecord::Migration[8.0]
  def change
    create_table :additional_services do |t|
      t.string :name
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end

    add_index :additional_services, :name
  end
end
