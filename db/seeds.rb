# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Information.create(lastname: '拍子木', firstname: '太郎')

require "csv"

information_csv = CSV.readlines("db/information.csv")
information_csv.each do |row|
  Product.create(lastname: row[1], firstname: row[2], lastnamekana: row[3], firstnamekana: row[4])
end