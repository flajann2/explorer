# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market do
    sequence(:stamp)   { |n| DateTime.now + n }
    sequence(:last)    { |n| 1.5 * (n % 53) }
    sequence(:bid)     { |n| 1.5 * (n % 53) - 0.25 }
    sequence(:ask)     { |n| 1.5 * (n % 53) + 0.25 }
    sequence(:size)    { |n| (n % 14) * 2 }
    sequence(:volume)  { |n| n % 100 + 1 }
    sequence(:tick_id) { |n| n }
    reserved1 "1"
    reserved2 "2"
    basic "C"
    symbol "SPY"
  end
end
