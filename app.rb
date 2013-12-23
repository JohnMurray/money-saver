require 'rubygems'
require 'bundler'
Bundler.require
require './database.rb'


class SavingsApp < Sinatra::Base

  configure do
    enable :static, :logging, :dump_errors
    set :root, File.dirname(__FILE__)
  end

  configure :development do
    enable :raise_errors
    enable :show_exceptions
  end

end


#----
# Load all the Sinatra Routes
#----
require_relative 'routes/init'