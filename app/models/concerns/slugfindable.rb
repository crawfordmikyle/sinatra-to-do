module Slugfindable
  module InstanceMethods
    def slug
      "#{self.firstname.downcase}-#{self.lastname.downcase}"
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end