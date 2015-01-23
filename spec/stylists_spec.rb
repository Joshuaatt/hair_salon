require('spec_helper')
require('stylists')

describe(Stylists) do
  describe(".all") do
    it("starts with no stylists") do
      expect(Stylists.all()).to(eq([]))
    end
  end
end
