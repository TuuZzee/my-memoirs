FactoryGirl.define do
  factory :user do
    name     "Guillaume Becker"
    email    "guillaume.becker@yopmail.com"
    password "M0t2p@ss"
    password_confirmation "M0t2p@ss"
  end
end