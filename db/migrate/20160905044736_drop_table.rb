class DropTable < ActiveRecord::Migration
  def up
    drop_table :comments
  end

  def down
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :pollution_event_id, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
