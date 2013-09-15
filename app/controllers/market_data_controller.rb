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
    respond_with @data = Market.srange(params[:symbol], 
                                       e2dt(params[:start]), 
                                       e2dt(params[:end]))
  end

  # convert millisecond epoch to a DateTime object
  def e2dt(epoch)
    Time.at(epoch.to_i / 1000).to_datetime 
  end
end
