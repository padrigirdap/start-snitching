class AddColumnEventLatLong < ActiveRecord::Migration
  def change
    add_column :pollution_events, :event_lat, :float, null: false
    add_column :pollution_events, :event_lng, :float, null: false
  end
end
