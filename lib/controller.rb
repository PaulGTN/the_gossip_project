#require 'bundler'
#Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index 
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts params
    gossip = Gossip.new(params["gossip_author"], params["gossip_content"])
    gossip.save
    redirect '/'
  end

  get '/gossips/:id' do
    @gossip = all_gossips.select do |gossip|
      gossip.id == params[:id]
    end.first
    erb :'/gossips/show.html'
  end
    #run! if app_file == $0

end 
