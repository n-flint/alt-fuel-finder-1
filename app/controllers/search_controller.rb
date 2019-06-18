class SearchController < ApplicationController

  def index
    render locals: {
      facade: NrelFacade.new(params[:q])
    }
  end
end
