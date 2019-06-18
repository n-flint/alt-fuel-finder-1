class Station
  attr_reader :name,
              :street_address,
              :city,
              :state,
              :zip,
              :fuel_type,
              :distance,
              :access_times

  def initialize(station)
    @name = station['station_name']
    @street_address = station['street_address']
    @city = station['city']
    @state = station['state']
    @zip = station['zip']
    @fuel_type = station['fuel_type_code']
    @distance = station['distance']
    @access_times = station['access_days_time']
  end
end