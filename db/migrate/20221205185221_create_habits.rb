class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.string :description
      t.integer :frequency
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
