class Task < ActiveRecord::Base
  db_magic :connection => :db_a
  attr_accessible :name
  self.primary_key = :id

  after_initialize do
    self.id ||= SecureRandom.uuid
  end
end
