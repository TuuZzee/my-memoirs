namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Capitaine Flam",
                 email: "cpt.flam@yopmail.com",
                 password: "mot2pass",
                 password_confirmation: "mot2pass",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "luc-#{n+1}@yopmail.com"
      password  = "m0t2pass"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end