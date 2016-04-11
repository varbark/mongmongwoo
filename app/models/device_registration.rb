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
end