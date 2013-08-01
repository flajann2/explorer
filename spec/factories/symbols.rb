# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :symbol, :class => 'Symbols' do
    symbol "SPY"
    stamp "2013-07-31 18:05:04"
  end
end
