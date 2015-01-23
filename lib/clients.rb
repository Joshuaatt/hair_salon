class Clients
  attr_reader(:id, :client_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @client_name = attributes.fetch(:client_name)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch("id").to_i()
      client_name = client.fetch("client_name")
      clients.push(Clients.new({:id => id, :client_name => client_name}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name()).&(self.id().==(another_client.id()))
  end


end
