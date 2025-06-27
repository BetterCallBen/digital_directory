class CreateAgencyTags < ActiveRecord::Migration[7.1]
  def change
    create_table :agency_tags do |t|
      t.references :agency, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    # Index pour éviter les doublons et améliorer les performances
    add_index :agency_tags, [:agency_id, :tag_id], unique: true
  end
end
