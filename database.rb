DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/money-saving")

class Saving
  include DataMapper::Resource
  property :id, Serial
  property :amount, Float
end

#
# Items that we want to buy
#
class Item
  attr_accessor :contrib_sum
  
  include DataMapper::Resource

  property :id,        Serial
  property :price,     Float,   :default => 0.0
  property :image_url, Text,    :default => ''

  has n, :contributions
end

#
# Contributions towards items 
#
class Contribution
  include DataMapper::Resource

  property :id,     Serial
  property :amount, Float

  belongs_to :item
end

DataMapper.finalize
#DataMapper.auto_upgrade!
