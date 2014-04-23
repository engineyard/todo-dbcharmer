require "connection_names"

class Task < ActiveRecord::Base
  attr_accessible :name
  self.primary_key = :id

  after_initialize do
    self.id ||= SecureRandom.uuid
  end
end
