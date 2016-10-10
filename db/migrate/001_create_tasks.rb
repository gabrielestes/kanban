require 'active_record'
require 'pg'

# adds tasks table
class CreateTasks < ActiveRecord::Migration[5.0]
  def up
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.string :status
      t.integer :priority
    end
  end

  def down
    drop_table :tasks
  end
end

def main
  action = (ARGV[0] || :up).to_sym
  CreateTasks.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
