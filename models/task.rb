require 'active_record'
require_relative '../db/migrate/001_create_tasks.rb'

# task model
class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :bulletin
end
