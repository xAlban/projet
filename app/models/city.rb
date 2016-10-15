class City < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true
  
  before_validation :geocode
  
  private
  
  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    self.lat = places.first.lat
    self.lon = places.first.lon
  end
end
