FactoryGirl.define do
  factory :user do
    name     "Guillaume Becker"
    email    "guillaume.becker@yopmail.com"
    password "mot2pass"
    password_confirmation "mot2pass"
  end
end