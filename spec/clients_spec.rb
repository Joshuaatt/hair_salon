require('spec_helper')
require('clients')

describe(Clients) do
  describe(".all") do
    it("starts with no clients") do
      expect(Clients.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client_name") do
      client1 = Clients.new({:client_name => 'Josh', :stylist_id => nil})
      client2 = Clients.new({:client_name => 'Josh', :stylist_id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe("#save") do
    it("saves clients to the database") do
      client1 = Clients.new({:client_name => 'Joe', :stylist_id => 1})
      client1.save()
      expect(Clients.all()).to(eq([client1]))
    end
  end
end
