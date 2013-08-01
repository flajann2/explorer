require 'spec_helper'

describe MarketDataController do

  describe "GET 'index'" do
    it "returns json success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'data'" do
    it "returns json success" do
      get 'data', symbol: 'SPY', start: DateTime.now, end: DateTime.now + 1
      response.should be_success
    end
  end
end
