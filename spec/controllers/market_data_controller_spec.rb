require 'spec_helper'

describe MarketDataController do
  before(:each) do
    @now = DateTime.now - 10
    @end = (@now.to_time.to_f * 1000).floor
    @start = @end - (3600 * 1000) # one hour in milliseconds
  end

  describe "GET 'index'" do
    it "defines @now, @start, and @end" do
      pp @now
      pp @start
      pp @end
    end

    it "returns json success" do
      get 'index'
      response.should be_success
    end

    it "events should work" do
      get 'events'
      response.should be_success
    end
  end

  describe "GET 'data'" do
    it "returns json success" do
      get 'data', symbol: 'SPY', start: @start, end: @end
      response.should be_success
    end
  end
end
