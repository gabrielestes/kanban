require 'active_record'
require_relative '../db/migrate/002_create_bulletins.rb'

#
class Bulletin < ActiveRecord::Base
  has_many :task
  belongs_to :user
end
