require 'active_record'
require 'pg'

# adds tasks table
class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :position
    end
  end

  def down
    drop_table :users
  end
end

def main
  action = (ARGV[0] || :up).to_sym
  CreateTasks.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
