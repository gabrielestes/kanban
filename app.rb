require 'sinatra'
require 'active_record'
require_relative 'models/task'
require 'json'
require 'pg'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

database_config = YAML::load(File.open('config/database.yml'))

before do
  content_type :json
end

after do
  ActiveRecord::Base.connection.close
end

get '/api' do
  'Please enter your task'
end

get '/api/tasks/' do
  # user_id = params['user_id']
  # title = params['title']
  # status = params['status']
  # priority = params['priority']
  tasks = Task.all.order(priority: :DESC)

  tasks.to_json
end

post '/api/tasks/' do
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

put '/api/tasks' do
  task = Task.get params[:id]
  if task.update(
    user_id: user_id,
    title: title,
    status: status,
    priority: priority
  )
    status 200
  else
    status 500
  end
end

delete '/api/tasks' do
  task = Task.get params[:id]
  if task.destroy
    status 200
    json "This task has been removed successfully."
  else
    status 500
    json "Task removal rejected."
  end
end
