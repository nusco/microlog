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
    post '/another_key', 'something different logged'

    get '/'
    assert last_response.ok?
    expected = "my_key: something logged\nanother_key: something different logged"
    assert_equal expected, last_response.body
  end

  def test_it_deletes_logs
    post '/my_key', 'something logged'
    delete '/'

    get '/'
    assert last_response.ok?
    assert_equal "", last_response.body
  end
end
