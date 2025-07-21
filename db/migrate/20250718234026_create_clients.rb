class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 50
      t.date :date_of_birth

      t.timestamps
    end

    add_index :clients, :name
  end
end
