require 'active_record'
require 'sinatra'
require 'pg'

configure :development do
  ActiveRecord::Base.establish_connection(
    adapter:  'postgresql', # or 'mysql2' or 'sqlite3'
    host:     'localhost',
    database: 'trello',
    username: 'Gabriel',
    password: 'HarryPotter'
  )
end
