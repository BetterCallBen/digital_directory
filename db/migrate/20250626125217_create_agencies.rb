class CreateAgencies < ActiveRecord::Migration[7.1]
  def change
    create_table :agencies do |t|
      t.string :name, null: false, limit: 255
      t.string :logo, limit: 500  # URL du logo
      t.date :creation_date, null: false
      t.decimal :annual_turnover, precision: 15, scale: 2, null: false
      t.text :location, null: false

      t.timestamps
    end

    # Index pour améliorer les performances des recherches
    add_index :agencies, :name
    add_index :agencies, :creation_date
    add_index :agencies, :annual_turnover
  end
end
