class Symbols
  include Mongoid::Document
  field :symbol, type: String
  field :stamp, type: DateTime
end
