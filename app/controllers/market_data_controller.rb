class MarketDataController < ApplicationController
  respond_to :json
  before_filter :default_to_json

  def default_to_json
    request.format = :json
  end

  def index
    respond_with @symbols = Symbols.list
  end

  def data
  end
end
