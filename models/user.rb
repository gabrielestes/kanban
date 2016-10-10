require 'active_record'
require_relative '../db/migrate/003_create_users.rb'

#
class User < ActiveRecord::Base
  has_many :bulletins
  has_many :tasks, through: :bulletins
end
