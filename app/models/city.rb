class City < ActiveRecord::Base
  validates :lat, :lon, presence: true
  before_validation :geocode
  public 
  
   def weather
		if self.lat
	    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si'})
    	results = {}
		 if forecast
			results[:temperature] = forecast.currently.temperature
			results[:summary] = forecast.currently.summary
		 end
    results
		else
			'unknown'
		end
	 end
  
  private
  
  def geocode
    places = Nominatim.search.city(self.name).limit(1)
		if places.first
    	self.lat = places.first.lat
    	self.lon = places.first.lon
		end	
  end
end
