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

get("/stylists/:id") do
  @stylists = Stylists.find(params.fetch("id").to_i())
  erb(:stylists)
end

post("/clients") do
  client_name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Clients.new({:client_name => client_name, :stylist_id => stylist_id})
  client.save()
  @stylists = Stylists.find(stylist_id)
  erb(:stylists)
end
