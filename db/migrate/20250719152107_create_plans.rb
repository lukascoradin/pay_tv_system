class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end

    add_index :plans, :name
  end
end
