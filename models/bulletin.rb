require 'active_record'
require_relative '../db/migrate/002_create_bulletins.rb'

#
class Bulletin < ActiveRecord::Base
  has_many :tasks
  belongs_to :users
end
