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
    post '/my_key/something_logged'
    post '/another_key/something_else_logged'

    get '/'
    assert last_response.body =~ /my_key: something_logged/
    assert last_response.body =~ /another_key: something_else_logged/
  end

  def test_it_overrides_logs
    post '/my_key/something_logged'
    post '/my_key/something_different_logged'

    get '/'
    assert last_response.body !~ /my_key: something_logged/
    assert last_response.body =~ /my_key: something_different_logged/
  end

  def test_it_deletes_logs
    post '/my_key/something_logged'
    delete '/'

    get '/'
    assert last_response.body !~ /something/
  end
end
