DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/sinatra-test")

#class Person
#  include DataMapper::Resource
#  property :id, Serial
#  property :firstname, String
#end

class Saving
  include DataMapper::Resource
  property :id, Serial
  property :amount, Float
end

DataMapper.finalize
DataMapper.auto_upgrade!
