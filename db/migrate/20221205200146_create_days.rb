class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.date :date
      t.boolean :status
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
