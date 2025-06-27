class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, limit: 100
      t.text :description

      t.timestamps
    end

    # Index pour améliorer les performances
    add_index :tags, :name, unique: true
  end
end
