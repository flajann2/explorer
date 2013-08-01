require 'spec_helper'

describe MarketDataController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'data'" do
    it "returns http success" do
      get 'data'
      response.should be_success
    end
  end

end
