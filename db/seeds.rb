# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Pod.destroy_all
Grantee.destroy_all
Country.destroy_all
TravelDate.destroy_all
State.destroy_all


grantee_arr = a = CSV.read("csv_files/03_grantees.csv")
puts "Creating grantees"
grantee_arr.each do |grantee|
  g = Grantee.new
  g.id = grantee[0]
  g.name = grantee[1]
  g.abbr = grantee[2]
  g.save
end
puts "Created #{Grantee.all.count} of #{grantee_arr.count} grantees"

country_arr = CSV.read("csv_files/04_countries.csv")
puts "Creating countries"
country_arr.each do |country|
  c = Country.new
  c.id = country[0]
  c.name = country[1]
  c.save
end
puts "Created #{Country.all.count} of #{country_arr.count} countries"

puts "Creating travel dates"
trvl_date_arr = CSV.read("csv_files/06_travel_dates.csv")
trvl_date_arr.shift
trvl_date_arr.each do |date|
  td = TravelDate.new
  td.id = date[0]
  td.date = date[1]
  td.save
end
puts "Created #{TravelDate.all.count} of #{trvl_date_arr.count} travel dates"

puts "Creating states"
state_arr = CSV.read("csv_files/01_states.csv")
state_arr.shift
state_arr.each do |state|
  s = State.new
  s.id = state[0]
  s.abbr = state[1]
  s.name = state[2]
  s.save
end
puts "Created #{State.all.count} of #{state_arr.count} states"

# add_pods
pods_arr = CSV.read("csv_files/07_groups.csv")
pods_arr.shift
pods_num = pods_arr.count
puts "Creating #{pods_num} pods"
pods_arr.each do |pod|
  puts pod
  new_pod = Pod.new
  new_pod.id = pod[0]
  new_pod.travel_date_id = pod[1]
  new_pod.arr_date = pod[2].to_date
  new_pod.country_id = pod[3]
  new_pod.host_org_id = pod[4]
  new_pod.grantee_id = pod[5]
  new_pod.theme = pod[6]
  new_pod.confirmed = pod[7]
  new_pod.notes = pod[8]
  new_pod.save
end
puts "Created #{Pod.all.count} of #{pods_num} pods"
