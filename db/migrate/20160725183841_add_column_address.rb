class AddColumnAddress < ActiveRecord::Migration
  def up
    add_column :pollution_events, :address, :string
  end

  def down
    remove_column :pollution_events, :address
  end
end
