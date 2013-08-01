require 'spec_helper'

describe Market do
  it "Gets market entries" do
    m = 100.times.map { |n| build(:market) }
    m[2].symbol.should == 'SPY'
  end
end
