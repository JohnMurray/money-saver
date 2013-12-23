class SavingsApp < Sinatra::Base

  #----
  # Home page, display, update, add items and contributions
  #----
  get '/' do
    @items = Item.all.to_a
    @items.each do |item|
      item.contrib_sum = item.contributions.inject(0) {|sum, c|
        sum + c.amount
      }
    end

    erb :saving
  end


  #----
  # Post-Receiver for adding an item
  #----
  post '/add-item' do
    Item.create(:price => params['price'].to_f, :image_url => params['url'])
    redirect '/'
  end

  #----
  # Post-Receiver for adding a contribution
  #----
  post '/contribute/:item_id' do
    params['item_id'] + params['amount']
    item = Item.get(params['item_id'].to_i)
    Contribution.create(amount: params['amount'].to_f, item: item)
    redirect '/'
  end

end