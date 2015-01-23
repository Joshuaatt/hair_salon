class Clients
  attr_reader(:id, :client_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @client_name = attributes.fetch(:client_name)
  end

end
