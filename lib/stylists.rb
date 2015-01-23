class Stylists
  attr_reader(:id, :stylist_name, :client_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @stylist_name = attributes.fetch(:stylist_name)
    @client_id = attributes.fetch(:client_id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch(:id).to_i()
      stylist_name = stylist.fetch(:stylist_name)
      client_id = stylist.fetch(:client_id)
      stylists.push(Stylists.new({:id => id, :stylist_name => stylist_name, :client_id => client_id}))
    end
    stylists
  end


end
