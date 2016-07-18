class CreatePollutionEvents < ActiveRecord::Migration
  def change
    create_table :pollution_events do |t|
      t.integer :user_id, null: false
      t.string  :name, null: false
      t.string  :address, null: false
      t.string  :city, null: false
      t.string  :state, null: false
      t.string  :zip, null: false
      t.text :description, null: false
      t.string :offender
      t.integer :likecount, null: false, default: 0
    end
  end
end
