require('spec_helper')
require('clients')

describe(Clients) do
  describe(".all") do
    it("starts with no clients") do
      expect(Clients.all()).to(eq([]))
    end
  end
end
