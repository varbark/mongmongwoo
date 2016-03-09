# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)
#  real_name  :string(255)
#  gender     :string(255)
#  address    :string(255)
#  uid        :string(255)
#  phone      :string(255)
#  status     :integer          default(1)
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  enum status: { disable: 0, enable: 1 }

  validates_presence_of :user_name, :real_name, :gender, :address, :uid, :phone
end