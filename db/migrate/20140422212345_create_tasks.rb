class CreateTasks < ActiveRecord::Migration
  db_magic connection: [:db_a, :db_b]
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
