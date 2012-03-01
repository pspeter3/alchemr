
# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

database_name = case Padrino.env
  when :development then 'alchemr_development'
  when :test        then 'alchemr_test'
end

if Padrino.env == :production
  Mongoid.database = Mongo::Connection.new('staff.mongohq.com', 10000).db('alchemr')
  Mongoid.database.authenticate 'alchemrapp', 'alchemrmh'
else
  Mongoid.database = Mongo::Connection.new(host, port).db(database_name)
end
