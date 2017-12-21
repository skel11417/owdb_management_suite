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

# add_pods
# pods_arr = CSV.read("csv_files/07_groups.csv")
pods_arr = [["id", "travel_date_id", "arr_date", "country_id", "host_org_id", "grantee_id", "theme", "confirmed", "notes"], ["1", "1", "1/31/2018", "150", "82", "4", "Nelson Fellows (Cardiology)", "true", nil], ["2", "1", "1/31/2018", "150", "8", "2", "Social Integration of Children and Adults with Disabilities", "true", nil], ["3", "1", "1/31/2018", "150", "71", "4", "Indigenous Groups ", "true", nil], ["4", "1", "1/31/2018", "150", "93", "4", "Indigenous Groups", "true", nil], ["5", "1", "1/31/2018", "150", "31", "3", "National Parks/Nature Preserves", "true", nil], ["6", "9", "2/7/2018", "196", "36", "12", "Role of Local Legislators/Staff", "true", nil], ["7", "9", "2/7/2018", "196", "73", "12", "Role of Local Legislators/Staff", "true", nil], ["8", "9", "2/7/2018", "196", "22", "3", "Role of Local Legislators/Staff", "true", nil], ["9", "9", "2/7/2018", "196", "26", "3", "Role of Local Legislators/Staff", "true", nil], ["10", "9", "2/7/2018", "196", "19", "3", "Role of Local Legislators/Staff", "false", nil], ["11", "12", "3/7/2018", "94", "17", "4", "Support for Small and Medium Enterprises", "false", nil], ["12", "12", "3/7/2018", "150", "35", "4", "STEM for Women Leaders", "false", nil], ["13", "12", "3/7/2018", "150", "85", "10", "STEM for Women Leaders", "false", "Nominator-Cherepovets-Sheksna Rotary Club"], ["14", "12", "3/7/2018", "150", "50", "10", "Small and Medium Business and e-Commerce", "false", nil], ["15", "12", "3/7/2018", "150", "78", "6", "Women Business Leaders", "false", nil], ["16", "12", "3/7/2018", "150", "55", "10", "Women Civic/Political Leaders", "false", nil], ["17", "12", "3/7/2018", "184", "10", "10", "Entrepreneurship and Small Business Development", "false", nil], ["18", "12", "3/7/2018", "184", "2", "4", "NGO Development", "false", nil], ["19", "10", "3/14/2018", "196", "49", "10", "Fire Department/EMT Management/Volunteerism", "false", nil], ["20", "10", "3/14/2018", "196", "64", "10", "Fire Department/EMT Management/Volunteerism", "false", "Possibly Bakersfield, CA FFI"], ["21", "10", "3/14/2018", "196", "27", "3", "Community Relations with Law Enforcement", "false", nil], ["22", "10", "3/14/2018", "196", "47", "6", "Community Development/Community Activism/Volunteerism", "false", nil], ["23", "10", "3/14/2018", "196", "14", "10", "Community Development/Community Activism/Volunteerism", "false", nil], ["24", "10", "3/14/2018", "196", "39", "4", "Social Entrepreneurship", "false", nil], ["25", "10", "3/14/2018", "196", "79", "4", "Social Entrepreneurship", "false", nil], ["26", "10", "3/14/2018", "67", "9", "4", "Abkhaz-Enguri Dam", "false", nil], ["27", "11", "3/19/2018", "196", "81", "4", "Members of Parliament", "false", nil], ["28", "13", "4/10/2018", "94", "65", "4", "Members of Parliament", "false", nil], ["29", "14", "4/11/2018", "196", "72", "4", "Serving Veterans/Veterans Affairs ", "false", nil], ["30", "14", "4/11/2018", "196", "42", "4", "Serving Veterans/ Veterans Affairs", "false", nil], ["31", "14", "4/11/2018", "196", "23", "3", "Treating PTSD and Reintegration", "false", nil], ["32", "14", "4/11/2018", "196", "76", "11", "Treating PTSD and Reintegration", "false", nil], ["33", "14", "4/11/2018", "196", "29", "3", "IDP Issues, Including Crimean Tatars", "false", nil], ["34", "14", "4/11/2018", "196", "67", "4", "IDP Issues, Displaced Universities", "false", nil], ["35", "15", "4/18/2018", "196", "48", "4", "Ukraine \x96 Court Automation", "false", nil], ["36", "15", "4/18/2018", "196", "18", "12", "Ukraine \x96 Court Automation", "false", nil], ["37", "15", "4/18/2018", "60", "76", "11", "Judges", "false", nil], ["38", "15", "4/18/2018", "67", "32", "5", "Judges", "false", nil], ["39", "15", "4/18/2018", "67", "12", "2", "Judges", "false", nil], ["40", "16", "4/24/2018", "184", "84", "4", "Members of Parliament", "false", nil], ["41", "18", "5/2/2018", "98", "24", "3", "Preventing and Combatting Corruption of Public Funds", "false", nil], ["42", "18", "5/2/2018", "98", "13", "4", "Agricultural Subsidies", "false", nil], ["43", "18", "5/2/2018", "12", "61", "4", "Disability Advocacy and Reform", "false", nil], ["44", "18", "5/2/2018", "12", "92", "4", "Cyber-Intellectual Property Rights", "false", nil], ["45", "20", "5/9/2018", "196", "56", "10", "Child Welfare, including Adoption/Foster Care ", "false", nil], ["46", "20", "5/9/2018", "196", "69", "12", "Child Welfare, including Adoption/Foster Care ", "false", nil], ["47", "20", "5/9/2018", "196", "16", "2", "Combatting Human Trafficking ", "false", nil], ["48", "20", "5/9/2018", "196", "45", "4", "Combatting Human Trafficking ", "false", nil], ["49", "20", "5/9/2018", "196", "76", "11", "Citizen Engagement in Legal Reform", "false", nil], ["50", "17", "5/15/2018", "159", "46", "4", "Members of Parliament", "false", nil], ["51", "19", "5/31/2018", "150", "89", "4", "Ecological Protection of Seaports", "false", "Delegates from Vladivostok "], ["52", "19", "5/31/2018", "150", "43", "10", "Sustainable Fishery Development and Management (Alaska)", "false", "Delegates from Vladivostok "], ["53", "19", "5/31/2018", "150", "11", "4", "Zoo Management", "false", nil], ["54", "19", "5/31/2018", "100", "63", "10", "Tourism Destination Management", "false", nil], ["55", "21", "6/18/2018", "67", "68", "10", "Members of Parliament", "false", nil], ["56", "22", "6/30/2018", "144", "20", "3", "Members of Parliament", "false", nil], ["57", "23", "7/18/2018", "124", "3", "4", "Judges", "false", nil], ["58", "23", "7/18/2018", "124", "86", "10", "Judges", "false", nil], ["59", "26", "9/5/2018", "196", "76", "11", "Decentralization/Intergovernmental Relations ", "false", nil], ["60", "26", "9/5/2018", "196", "76", "11", "Decentralization/Intergovernmental Relations ", "false", nil], ["61", "26", "9/5/2018", "196", "21", "3", "Health Care Management and Quality Assurance ", "false", nil], ["62", "26", "9/5/2018", "196", "62", "10", "Health Care Management and Quality Assurance ", "false", "Nominator-Kiev Rotary Club"], ["63", "26", "9/5/2018", "196", "28", "3", "Health Care Practitioner Innovation, including Telemedicine ", "false", nil], ["64", "26", "9/5/2018", "196", "38", "4", "Health Care Practitioner Innovation, including Telemedicine ", "false", nil], ["65", "24", "9/12/2018", "150", "91", "4", "Young Arms Control Experts", "false", nil], ["66", "24", "9/12/2018", "150", "37", "4", "Countering Violent Extremism in Muslim Communities", "false", nil], ["67", "24", "9/12/2018", "150", "88", "6", "Prison Officials and Prison Rights Activists", "false", nil], ["68", "24", "9/12/2018", "150", "70", "4", "Public Defenders", "false", nil], ["69", "24", "9/12/2018", "150", "52", "7", "Women Civic/Political Leaders", "false", nil], ["70", "24", "9/12/2018", "94", "90", "4", "Prison Reform", "false", nil], ["71", "25", "9/25/2018", "100", "93", "4", "Members of Parliament", "false", nil], ["72", "2", "10/10/2018", "196", "66", "4", "Government Funding/Oversight of Educational Institutions", "false", nil], ["73", "2", "10/10/2018", "196", "30", "3", "Government Funding/Oversight of Educational Institutions", "false", nil], ["74", "2", "10/10/2018", "196", "57", "12", "Innovation and Education", "false", nil], ["75", "2", "10/10/2018", "196", "51", "6", "Innovation and Education", "false", nil], ["76", "2", "10/10/2018", "196", "80", "4", "Promoting STEM Education/Alternative Learning", "false", "Nominator"], ["77", "2", "10/10/2018", "196", "40", "10", "Promoting STEM Education/Alternative Learning", "false", nil], ["78", "2", "10/10/2018", "196", "60", "4", "Community College/Vocational Education", "false", nil], ["79", "2", "10/10/2018", "196", "25", "3", "IDP Issues, Displaced Universities", "false", nil], ["80", "2", "10/10/2018", "159", "34", "4", "Higher Education Reform", "false", nil], ["81", "2", "10/10/2018", "159", "33", "4", "English Access Program", "false", nil], ["82", "3", "10/15/2018", "201", "#N/A", "11", "Members of Parliament", "false", nil], ["83", "4", "10/17/2018", "159", "1", "4", "Judges", "false", nil], ["84", "4", "10/17/2018", "100", "75", "11", "Judges (Judicial Practices and Procedures for International Adoptions)", "false", nil], ["85", "5", "10/24/2018", "150", "59", "4", "Municipal Elected Officials and Constituent Outreach ", "false", "Delegates from Kaliningrad "], ["86", "5", "10/24/2018", "150", "7", "4", "Foreign Affairs Journalism", "false", nil], ["87", "5", "10/24/2018", "150", "83", "4", "Digital Media", "false", "Sister City-Yaroslavl"], ["88", "5", "10/24/2018", "150", "6", "2", "Media Literacy", "false", "Delegates from Volgograd"], ["89", "5", "10/24/2018", "150", "53", "8", "Monitoring Human Rights Cases", "false", "Delegates from Leningrad"], ["90", "5", "10/24/2018", "150", "74", "4", "Existing Partnerships", "false", "Nominator"], ["91", "5", "10/24/2018", "150", "87", "10", "Existing Partnerships", "false", nil], ["92", "5", "10/24/2018", "150", "77", "1", "Existing Partnerships", "false", "Delegates from Arkhangelsk"], ["93", "5", "10/24/2018", "150", "41", "4", "Existing Partnerships", "false", "Nominator-Rubtsovsk"], ["94", "6", "10/31/2018", "196", "15", "10", "Ethics and Quality Reporting ", "false", nil], ["95", "6", "10/31/2018", "196", "4", "12", "Ethics and Quality Reporting ", "false", nil], ["96", "6", "10/31/2018", "196", "5", "12", "Media Coverage of Political Leaders and Elections ", "false", "Delegates from Kharkiv"], ["97", "6", "10/31/2018", "196", "54", "4", "Media Coverage of Political Leaders and Elections", "false", nil], ["98", "8", "12/31/2018", "150", "58", "9", "Moscow School of Civic Education (9)", "false", nil], ["99", "8", "12/31/2018", "150", "58", "9", "Moscow School of Civic Education (9)", "false", nil], ["100", "7", "11/27/2018", "196", "44", "4", "Members of Parliament", "false", nil]]


pods_arr.shift
pods_num = pods_arr.count
created_pods = 0
puts "Creating pods"
pods_arr.each do |pod|
  p = Pod.new
  p.id = pod[0]
  p.travel_date_id = pod[1]
  p.arr_date = pod[2]
  p.country_id = pod[3]
  p.host_org_id = pod[4]
  p.grantee_id = pod[5]
  p.theme = pod[6]
  p.confirmed = pod[7]
  p.notes = pod[8]
  p.save
  created_pods += 1
end
puts "Created #{created_pods} of #{pods_num} pods"

grantee_arr = a = CSV.read("csv_files/03_grantees.csv")
puts "Creating grantees"
created_grantees = 0
grantee_arr.each do |grantee|
  g = Grantee.new
  g.id = grantee[0]
  g.name = grantee[1]
  g.abbr = grantee[2]
  g.save
  created_grantees += 1
end
puts "Created #{created_grantees} of #{grantee_arr.count} grantees"

country_arr = CSV.read("csv_files/04_countries.csv")
puts "Creating countries"
created_countries = 0
country_arr.each do |country|
  c = Country.new
  c.id = country[0]
  c.name = country[1]
  c.save
  created_countries += 1
end
puts "Created #{created_countries} of #{country_arr.count} countries"
