require 'bundler/setup'

task :default => :test

desc 'Run local tests'
task :test do
  require './test/microlog_test'
end

desc 'Clear the online log'
task :clear do
  require 'rest-client'
  RestClient.delete 'http://microlog.herokuapp.com/'
end

desc 'Post a few test lines to the online log'
task :test_post do
  require 'rest-client'
  RestClient.post 'http://microlog.herokuapp.com/my_log/actually_works', {}
  RestClient.post 'http://microlog.herokuapp.com/and/it_is_amazing', {}
end
