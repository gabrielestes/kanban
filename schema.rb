require 'active_record'
require_relative 'environment'
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

class CreateBulletins < ActiveRecord::Migration[5.0]
  def up
    create_table :bulletins do |t|
      t.integer :user_id
      t.string :title
      t.integer :items
    end
  end

  def down
    drop_table :bulletins
  end
end

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
  CreateBulletins.migrate(action)
  CreateUsers.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
