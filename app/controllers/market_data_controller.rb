class MarketDataController < ApplicationController
  respond_to :json
  before_filter :default_to_json

  def default_to_json
    request.format = :json
  end

  def index
    respond_with @symbols = Symbols.list.map{|sy| {name: sy} }
  end

  def data
    symbol = params[:symbol]
    tstart = DateTime.parse params[:start]
    tend = DateTime.parse params[:end]
    respond_with @data = Market.srange(symbol, tstart, tend)
  end
end
