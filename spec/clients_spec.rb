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
      client1 = Clients.new({:id => nil, :client_name => 'Josh'})
      client2 = Clients.new({:id => nil, :client_name => 'Josh'})
      expect(client1).to(eq(client2))
    end
  end
end
