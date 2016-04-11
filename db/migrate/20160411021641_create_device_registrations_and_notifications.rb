class CreateDeviceRegistrationsAndNotifications < ActiveRecord::Migration
  def change
    create_table :device_registrations do |t|
      t.integer :user_id
      t.string :registration_id
      t.timestamps
    end

    create_table :notifications do |t|
      t.integer :item_id
      t.string :content_title
      t.string :content_text
      t.string :content_pic
      t.timestamps
    end
  end
end