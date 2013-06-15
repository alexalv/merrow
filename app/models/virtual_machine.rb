class VirtualMachine < ActiveRecord::Base
  STATES = %w[starting running stopped saved]
  attr_accessible :vmconfig_id, :description, :macaddr, :name,:connection_s,:user_id,:state,:uuid,:server_id, :os_image_id
  validates :description, :vmconfig_id, :name, :os_image_id, presence: true
  belongs_to :user
  belongs_to :os_image
  belongs_to :server
  belongs_to :vmconfig
end
