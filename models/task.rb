require 'active_record'
require_relative '../db/migrate/001_create_tasks.rb'

# movie model
class Task < ActiveRecord::Base
  validates :id, :title, :status, :priority, presence: true
end
