require 'csv'

# Grantee.destroy_all
# Country.destroy_all
# TravelDate.destroy_all
# State.destroy_all
# Pod.destroy_all
# HostOrg.destroy_all
City.destroy_all


# grantee_arr = a = CSV.read("csv_files/03_grantees.csv")
# puts "Creating grantees"
# grantee_arr.each do |grantee|
#   g = Grantee.new
#   g.id = grantee[0]
#   g.name = grantee[1]
#   g.abbr = grantee[2]
#   g.save
# end
# puts "Created #{Grantee.all.count} of #{grantee_arr.count} grantees"
#
# country_arr = CSV.read("csv_files/04_countries.csv")
# puts "Creating countries"
# country_arr.each do |country|
#   c = Country.new
#   c.id = country[0]
#   c.name = country[1]
#   c.save
# end
# puts "Created #{Country.all.count} of #{country_arr.count} countries"
#
# puts "Creating travel dates"
# trvl_date_arr = CSV.read("csv_files/06_travel_dates.csv")
# trvl_date_arr.shift
# trvl_date_arr.each do |date|
#   td = TravelDate.new
#   td.id = date[0]
#   td.date = date[1]
#   td.save
# end
# puts "Created #{TravelDate.all.count} of #{trvl_date_arr.count} travel dates"
#
# puts "Creating states"
# state_arr = CSV.read("csv_files/01_states.csv")
# state_arr.shift
# state_arr.each do |state|
#   s = State.new
#   s.id = state[0]
#   s.abbr = state[1]
#   s.name = state[2]
#   s.save
# end
# puts "Created #{State.all.count} of #{state_arr.count} states"
#
# # add_pods
# pods_arr = CSV.read("csv_files/07_groups.csv")
# pods_arr.shift
# puts "Creating #{pods_arr.count} pods"
# pods_arr.each do |pod|
#   new_pod = Pod.new
#   new_pod.id = pod[0]
#   new_pod.travel_date_id = pod[1]
#   new_pod.arr_date = pod[2].to_date
#   new_pod.country_id = pod[3]
#   new_pod.host_org_id = pod[4]
#   new_pod.grantee_id = pod[5]
#   new_pod.theme = pod[6]
#   new_pod.confirmed = pod[7]
#   new_pod.notes = pod[8]
#   new_pod.save
# end
# puts "Created #{Pod.all.count} of #{pods_arr.count} pods"

# host_arr = CSV.read("csv_files/05_host_orgs.csv")
# host_arr.shift
# puts "Creating #{host_arr.count} Host Organizations"
# host_arr.each do |host|
# 	h = HostOrg.new
# 	h.id = host[0]
# 	h.name = host[1]
# 	h.city_id = host[2]
# 	h.save
# end
# puts "Created #{HostOrg.all.count} of #{host_arr.count} host organizations"

# add cities
city_arr = CSV.read("csv_files/02_cities.csv")
city_arr.shift
puts "Creating #{city_arr.count} cities"
city_ids = HostOrg.all.select(:city_id)
city_ids_arr = []
city_ids.each do |rel|
  city_ids_arr << rel.city_id
end

city_arr.each do |city|
  if city_ids_arr.include?(city[1].to_i)
    c = City.new
    c.id = city[1]
    c.name = city[2]
    c.state_id = city[3]
    c.save
  end
end
puts "Created #{City.all.count} of #{city_arr.count}"
