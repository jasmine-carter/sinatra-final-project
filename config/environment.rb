ENV['SINATRA_ENV'] ||= "development"
require 'sinatra/base'
require 'bundler/setup'
require 'sysrandom/securerandom'
#require 'rack-flash'
ENV['SESSION_SECRET'] ||= "c402ade9084768420332d49a939d0748df2eb0e2f15d64943f8d07c1facdcdd348d298c8376978cb91d233e19ad9f05bc998f6a60ff587d845348590cc49c329"
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
