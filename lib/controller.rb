require_relative 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/gossips' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'

  end

  get '/' do
  erb :index, locals: {gossips: Gossip.all}
  end


end
