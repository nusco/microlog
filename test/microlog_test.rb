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
    assert last_response.ok?
    expected = "my_key: something logged\nanother_key: something else logged"
    assert_equal expected, last_response.body
  end
end
