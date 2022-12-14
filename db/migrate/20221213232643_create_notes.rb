class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :text
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
