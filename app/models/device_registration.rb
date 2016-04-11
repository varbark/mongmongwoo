# == Schema Information
#
# Table name: device_registrations
#
#  id              :integer          not null, primary key
#  registration_id :integer
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class DeviceRegistration < ActiveRecord::Base
  validates_presence_of :registration_id, on: :create
  validates_uniqueness_of :registration_id, on: :create, message: "裝置ID重複了"
end