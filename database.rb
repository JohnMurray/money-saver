DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/money-saving")

class Saving
  include DataMapper::Resource
  property :id, Serial
  property :amount, Float
end

DataMapper.finalize
#DataMapper.auto_upgrade!
