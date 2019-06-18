class NrelFacade
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def station_count
    data = Farada.get()

  end


end