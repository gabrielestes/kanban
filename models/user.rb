require 'active_record'
require_relative '../db/migrate/003_create_users.rb'

#
class User < ActiveRecord::Base
  validates :user_id, :name, :position, presence: true
  has_many :tasks, through: :bulletins
end
