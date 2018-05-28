class CreateDiseases < ActiveRecord::Migration[5.2]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :symptomes
      t.string :latin_name
      t.text :disease_explanation
      t.text :usual_medication

      t.timestamps
    end
  end
end
