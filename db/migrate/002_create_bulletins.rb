require 'active_record'
require 'pg'

# adds tasks table
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

def main
  action = (ARGV[0] || :up).to_sym
  CreateTasks.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
