class CreateTasks < ActiveRecord::Migration
  db_magic connection: [:db_a]
  def up
    create_table :tasks do |t|
      t.string :name
      t.timestamps
    end

  end

  def down
    drop_table :tasks
  end
end
