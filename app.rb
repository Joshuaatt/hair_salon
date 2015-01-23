require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylists')
require('./lib/clients')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylists.all()
  erb(:index)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylists.new({:stylist_name => stylist_name, :id => nil})
  stylist.save()
  @stylists = Stylists.all()
  erb(:index)
end
