class SearchController < ApplicationController

  def index
    require 'pry'; binding.pry
    render locals: {
      facade: NrelFacade.new(params[:q])
    }
  end
end
