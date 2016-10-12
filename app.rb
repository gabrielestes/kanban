require 'sinatra'
require 'active_record'
require_relative 'models/bulletin'
require_relative 'models/task'
require_relative 'models/user'
require 'yaml'
require 'json'
require 'pg'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

before do
  content_type :json
end

database_config = YAML::load(File.open('config/database.yml'))

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/api' do
  'Please enter your task'
end

# ALL TASKS
get '/api/tasks' do
  tasks = Task.all.order(priority: :DESC)
  tasks.to_json
end

# NEW TASK
post '/api/tasks' do
  user_id = params['user_id']
  title = params['title']
  status = params['status']
  priority = params['priority']

  task = Task.new(
    user_id: user_id,
    title: title,
    status: status,
    priority: priority
  )
  if task.save
    task.to_json
  else
    error 500
  end
end

# FIND AND UPDATE TASK
put '/api/tasks/:id' do
  task = Task.where(id: params['id']).first
  if task.update(
    user_id: user_id,
    title: title,
    status: status,
    priority: priority
  )
    task.to_json
    status 200
  else
    status 500
  end
end

# DELETE TASK
delete '/api/tasks/:id' do |id|
  if Task.delete(id) == 1
    status 200
  else
    status 404
  end

  {}.to_json
end

# ALL BULLETINS
get '/api/bulletins' do
  Bulletin.all.to_json(include: :tasks)
end

# ONE BULLETIN
get '/api/bulletins/:id' do
  Bulletin.where(id: params['id'])
end

# NEW BULLETIN
get '/api/bulletins' do
  bulletin = Bulletin.new(params)

  if bulletin.save
    bulletin.to_json
  else
    status 500
  end
end
