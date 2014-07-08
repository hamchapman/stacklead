require 'sinatra/base'
require 'mongo'
require 'uri'
require 'bson'
require 'json'

class Stacklead < Sinatra::Base

  helpers ApplicationHelper
  include Mongo

  if ENV['MONGOHQ_URL']
    db = URI.parse(ENV['MONGOHQ_URL'])
    db_name = db.path.gsub(/^\//, '')
    db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
    db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
    db_connection
    set :mongo_db, db_connection
  else
    conn = MongoClient.new("localhost", 27017)
    set :mongo_db, conn.db('stacklead')
  end

  lead_collection = mongo_db['stacklead']['leads']

  get '/' do
    'Hello world!'
  end

  post '/stacklead' do
    data = JSON.load(request.body)
    lead_collection.insert data
  end

  run! if app_file == $0
end