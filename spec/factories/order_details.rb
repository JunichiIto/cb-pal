# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_detail do
    order nil
    bread nil
    quantity "9.99"
  end
end
