class NrelFacade

  def initialize(zip)
    @zip = zip.to_i
  end

  def total_stations
    service.station_count
  end

  def stations
    service.stations
  end

  private
    def service
      @_service ||= NrelService.new(@zip)
    end
end
