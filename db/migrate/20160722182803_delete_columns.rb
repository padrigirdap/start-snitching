class DeleteColumns < ActiveRecord::Migration
  def up
    remove_column :pollution_events, :city
    remove_column :pollution_events, :state
    remove_column :pollution_events, :zip
  end

  def down
    add_column :pollution_events, :city, :string, null: false
    add_column :pollution_events, :state, :string, null: false
    add_column :pollution_events, :zip, :string, null: false
  end
end
