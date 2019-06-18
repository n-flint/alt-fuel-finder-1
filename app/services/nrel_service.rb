class NrelService

  def initialize(zip)
    @zip = zip
  end

  def station_count
    json['total_results']
  end

  def stations(limit = 15)
    stations = json['fuel_stations'].first(limit)

    stations.map do |station|
      Station.new(station)
    end

  end

  private
    def conn
      Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_KEY']}&location=#{@zip}&fuel_type=ELEC,LPG&access=public&status=E")
    end

    def json
      JSON.parse(conn.body)
    end
end