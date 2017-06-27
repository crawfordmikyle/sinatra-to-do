class Task < ActiveRecord::Base
	include Slugfindable::InstanceMethods
	extend Slugfindable::ClassMethods
	belongs_to :user
end 