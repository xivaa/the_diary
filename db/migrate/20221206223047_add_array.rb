class AddArray < ActiveRecord::Migration[7.0]
  def change
    remove_column :habits, :frequency
    add_column :habits, :frequency, :string, array: true
  end
end
