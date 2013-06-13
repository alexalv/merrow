class VirtualMachine < ActiveRecord::Base
  STATES = %w[starting running stopped saved]
  attr_accessible :vmconfig_id, :description, :macaddr, :name,:image,:connection_s,:user_id,:state,:uuid,:server_id
  belongs_to :user
  belongs_to :server
  has_one :vmconfig
end
