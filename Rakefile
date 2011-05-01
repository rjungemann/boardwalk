require 'mongo'

desc ''
task :mongo_start do
  sh 'mongod run --config mongod.conf'
end

desc ''
task :mongo_clear do
  mongo = Mongo::Connection.new
  mongo.drop_database 'boardwalk_production'
end

desc ''
task :start do
  sh 'bin/boardwalk'
end

desc ''
task :spec do
  sh 'bundle exec rspec spec/boardwalk.rb'
end
