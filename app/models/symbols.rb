class Symbols
  include Mongoid::Document
  field :symbol, type: String
  field :stamp, type: DateTime

  def self.list 
    collection.aggregate("$project" => {symbol: 1}).map{|m| m['symbol']}
  end
end
