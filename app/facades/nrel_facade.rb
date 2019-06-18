class NrelFacade

  def initialize(zip)
    @zip = zip.to_i
  end

  def total_stations
    service.station_count
  end

  def stations
    conn = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_KEY']}&location=#{@zip}&fuel_type=ELEC,LPG&access=public&status=E")
    stations = JSON.parse(conn.body)['fuel_stations'].first(15)

    stations.map do |station|
      Station.new(station)
    end
  end

  def service
    @_service ||= NrelService.new(@zip)
  end
end
