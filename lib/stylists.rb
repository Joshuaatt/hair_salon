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
end
