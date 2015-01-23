require('spec_helper')
require('stylists')

describe(Stylists) do
  describe(".all") do
    it("starts with no stylists") do
      expect(Stylists.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same stylist_name") do
      stylist1 = Stylists.new({:id => nil, :stylist_name => 'Josh', :client_id => nil})
      stylist2 = Stylists.new({:id => nil, :stylist_name => 'Josh', :client_id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#save") do
    it("saves stylists to the database") do
      stylist1 = Stylists.new({:id => nil, :stylist_name => 'Sally', :client_id => nil})
      stylist1.save()
      expect(Stylists.all()).to(eq([stylist1]))
    end
  end
end
