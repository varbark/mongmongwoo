class CreateDeviceRegistrationsAndNotifications < ActiveRecord::Migration
  def change
    create_table :device_registrations do |t|
      t.integer :registration_id, :user_id
      t.timestamps
    end

    create_table :notifications do |t|
      t.integer :item_id
      t.string :content_title
      t.text :content_text
      t.string :content_pic
      t.timestamps
    end
  end
end