# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(email: 'admin@admin.com', password: "12345678" ,password_confirmation: "12345678",first_name: "admin")
   role = user.add_role "admin"
 ExpenseLabel.create(name: 'Fertilizer')
 ExpenseLabel.create(name: 'Seed')
 ExpenseLabel.create(name: 'Chemical')
 ExpenseLabel.create(name: 'Insurance')
 ExpenseLabel.create(name: 'Fuel')
 ExpenseLabel.create(name: 'Land Rent')
 ExpenseLabel.create(name: 'Over head')
 ExpenseLabel.create(name: 'Family Living')
 @years=Year.all
 @years.each do |year|
 CropInformation.create(crop_name: 'Corn',year:year.year)
 CropInformation.create(crop_name: 'Soyabean',year:year.year)
 CropInformation.create(crop_name: 'Wheat',year:year.year)
 end