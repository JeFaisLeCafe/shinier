class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :upvotes, default: 0
      t.integer :reports, default: 0
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
