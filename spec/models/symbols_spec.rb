require 'spec_helper'

describe Symbols do
  pending "add some examples to (or delete) #{__FILE__}"

  it "Gets a Symbol" do
    s = build(:symbol)
    s.symbol.should == 'SPY'
  end
end
