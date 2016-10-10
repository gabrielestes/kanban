require 'active_record'
require_relative '../db/migrate/001_create_tasks.rb'

# task model
class Task < ActiveRecord::Base
  validates :user_id, :title, :status, :priority, presence: true
  belongs_to :bulletins
end
