class NrelFacade
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    require 'pry'; binding.pry
  end


end