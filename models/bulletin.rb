require 'active_record'
require_relative '../db/migrate/002_create_bulletins.rb'

#
class Bulletin < ActiveRecord::Base
  validates :user_id, :title, :items, presence: true
  has_many :tasks
end
