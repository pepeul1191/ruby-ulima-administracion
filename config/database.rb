require 'sequel'
require 'sqlite3'

Sequel::Model.plugin :json_serializer

DB = Sequel.connect('sqlite://db/ulima.db')
