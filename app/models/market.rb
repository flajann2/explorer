class Market
  include Mongoid::Document
  store_in collection: 'market'
 
  field :stamp, type: DateTime
  field :last, type: Float
  field :size, type: Integer
  field :volume, type: Integer
  field :bid, type: Float
  field :ask, type: Float
  field :tick_id, type: Integer
  field :reserved1, type: String
  field :reserved2, type: String
  field :basic, type: String
  field :symbol, type: String

  scope :sbefore, ->(sym, before) { where(symbol: sym, :stamp.lt => before) }
  scope :safter, ->(sym, after) { where(symbol: sym, :stamp.gte => after) }
  scope :srange, ->(sym, after, before) { sbefore(sym, before).safter(sym, after) }

  # This class is read only!!!
  #def save; raise "READ ONLY"; end
  #def save!; raise "READ ONLY"; end
end
