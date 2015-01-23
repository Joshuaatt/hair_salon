class Stylists
  attr_reader(:id, :stylist_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @stylist_name = attributes.fetch(:stylist_name)
  end

  
end
