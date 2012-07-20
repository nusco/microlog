require './lib/microlog'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class MicrologTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_shows_logs
    post '/my_key', 'something logged'
    post '/another_key', 'something else logged'

    get '/'
    assert last_response.body =~ /my_key: something logged/
    assert last_response.body =~ /another_key: something else logged/
  end

  def test_it_overrides_logs
    post '/my_key', 'something logged'
    post '/my_key', 'something different logged'

    get '/'
    assert last_response.body !~ /my_key: something logged/
    assert last_response.body =~ /my_key: something different logged/
  end

  def test_it_deletes_logs
    post '/my_key', 'something logged'
    delete '/'

    get '/'
    assert last_response.body !~ /something/
  end
end
