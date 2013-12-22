require 'rubygems'
require 'bundler'
Bundler.require
require './database.rb'

set :root, File.dirname(__FILE__)

get '/' do
  @items = Item.all.to_a
  @items.each do |item|
    item.contrib_sum = item.contributions.inject(0) {|sum, c|
      sum + c.amount
    }
  end

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

post '/add-item' do
  Item.create(:price => params['price'].to_f, :image_url => params['url'])
  redirect '/'
end

post '/contribute/:item_id' do
  params['item_id'] + params['amount']
  item = Item.get(params['item_id'].to_i)
  Contribution.create(amount: params['amount'].to_f, item: item)
  redirect '/'
end
