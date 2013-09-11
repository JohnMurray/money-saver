require 'rubygems'
require 'bundler'
Bundler.require
require './database.rb'

set :root, File.dirname(__FILE__)

get '/' do
  @savings = Saving.all.to_a
  erb :saving
end

post '/add' do
  Saving.create(:amount => params['amount'].to_f)
  redirect '/'
end

get '/destroy-all' do
  Saving.all.each {|s| s.destroy}
  redirect '/'
end
