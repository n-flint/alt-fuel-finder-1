class NrelService

  def initialize(zip)
    @zip = zip
  end

  def station_count
    JSON.parse(conn.body)['total_results']
  end

  private
    def conn
      Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_KEY']}&location=#{@zip}&fuel_type=ELEC,LPG&access=public&status=E")
    end

end