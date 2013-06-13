class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :admin, :crypted_password, :email, :fname, :name, :password_salt, :persistence_token, :username, :password, :password_confirmation
  has_many :virtual_machines
end
