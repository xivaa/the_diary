class AddCompletedToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :completed, :boolean, default: false
  end
end
