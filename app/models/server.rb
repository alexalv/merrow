class Server < ActiveRecord::Base
  attr_accessible :hardware, :ip, :key
end
