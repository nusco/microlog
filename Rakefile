require 'bundler/setup'

task :default => :test

desc 'Run local tests'
task :test do
  require './test/microlog_test'
end

desc 'Clear the online log'
task :clear do
  require 'rest-client'
  RestClient.delete 'http://microlog.heroku.com/'
end

desc 'Post a few test lines to the online log'
task :test_post do
  require 'rest-client'
  RestClient.post 'http://microlog.heroku.com/my_log', 'actually works!'
  RestClient.post 'http://microlog.heroku.com/and', 'it\'s amazing'
end
