class Snapshot < ActiveRecord::Base
  attr_accessible :description, :file, :name
end
