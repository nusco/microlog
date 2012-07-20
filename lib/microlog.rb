require 'bundler/setup'
require 'sinatra'

LOG = {}

get '/' do
  erb '<html>
       <head>
         <title>microlog</title>
         <meta http-equiv="refresh" content="5" >
       </head>
       <body>
         <% lines.each do |line| %>
         <%= line %><br/>
         <% end %>
       </body>',
      :locals => { :lines => LOG.map {|k, v| "#{k}: #{v}"} }
end

post '/:key' do
  LOG[params[:key]] = request.body.read
end

delete '/' do
  LOG.clear
end
