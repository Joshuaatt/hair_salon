class Clients
  attr_reader(:client_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Clients.new({:client_name => client_name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id})")
  end

end
