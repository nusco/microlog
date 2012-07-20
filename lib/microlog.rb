require 'sinatra'

LOG = {}

get '/' do
  erb "<%= lines.join(\"\n\") %>",
      :locals => { :lines => LOG.map {|k, v| "#{k}: #{v}"} }
end

post '/:key' do
  LOG[params[:key]] = request.body.read
end

delete '/' do
  LOG.clear
end
