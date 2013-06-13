class Vmconfig < ActiveRecord::Base
  attr_accessible :memory, :vcpu, :description, :name
  has_many :virtual_machines
end
