class Stylists
  attr_reader(:id, :stylist_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @stylist_name = attributes.fetch(:stylist_name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch("id").to_i()
      stylist_name = stylist.fetch("stylist_name")
      stylists.push(Stylists.new({:id => id, :stylist_name => stylist_name}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.stylist_name().==(another_stylist.stylist_name()).&(self.id().==(another_stylist.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylists.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()}")
    clients.each() do |client|
      client_name = client.fetch("client_name")
      stylist_id = client.fetch("stylist_id").to_i()
      list_clients.push(Clients.new({:client_name => client_name, :stylist_id => stylist_id}))
    end
    list_clients
  end
end
