class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.references :first_place, foreign_key: { to_table: :games }
      t.references :second_place, foreign_key: { to_table: :games }

      t.timestamps
    end
  end
end
