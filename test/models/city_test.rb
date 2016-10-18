require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "invalid city" do
    VCR.use_cassette("nominatim2") do
      incorrect = City.new name: cities(:two).name
      assert incorrect.invalid?
    end
  end
  
  test "valid city" do
    VCR.use_cassette("nominatim1") do
      incorrect = City.new name: cities(:one).name
      assert incorrect.valid?
    end
  end  
end