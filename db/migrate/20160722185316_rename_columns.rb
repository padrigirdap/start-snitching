class RenameColumns < ActiveRecord::Migration
  def up
    rename_column :pollution_events, :name, :title
    rename_column :pollution_events, :offender, :url
  end

  def down
    rename_column :pollution_events, :title, :name
    rename_column :pollution_events, :url, :offender
  end
end
