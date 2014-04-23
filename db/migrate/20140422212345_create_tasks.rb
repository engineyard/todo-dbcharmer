require "connection_names"

class CreateTasks < ActiveRecord::Migration
  db_magic connection: TodoDbCharmer::ConnectionNames.all(:default)
  def up
    if !ActiveRecord::Base.connection.table_exists?('tasks')
      create_table :tasks, id: false, primary_key: :id do |t|
        t.string :id, limit: 36
        t.string :name
        t.timestamps
      end
    end
  end

  def down
    drop_table :tasks
  end
end
