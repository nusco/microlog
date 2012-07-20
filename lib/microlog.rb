require 'sinatra'

LOG = {}

get '/' do
  LOG.map {|k, v| "#{k}: #{v}"}.join "\n"
end

post '/:key' do
  LOG[params[:key]] = request.body.read
end
