class ChangeColumn < ActiveRecord::Migration
  def up
    remove_column :pollution_events, :address
  end

  def down
    add_column :pollution_events, :address, :string
  end
end
