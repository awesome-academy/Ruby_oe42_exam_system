class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :answer
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
