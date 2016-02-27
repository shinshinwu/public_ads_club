# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

listings = Listing.create([
  {user_id: 1, title: "Awesome Ad Space", category: "Billboard", description: "Life is too short for shitty ads (space)", width: 20, height: 30, base_amount: 100, recurring_amount: 50.95, is_available: true, phone: "1231231234", ref_id: "vd-2342", charge_frequency: "yearly", company_name: "Best Ad Provider", min_lease_days: 30},
  {user_id: 1, title: "Awesome Ad Space #2", category: "Bus Stop", description: "Life is too short for shitty ads (space)", width: 50, height: 80, base_amount: 150.99, recurring_amount: 100.95, is_available: false, phone: "1231231235", charge_frequency: "monthly" ,ref_id: "sf-2342", company_name: "Best Ad Provider", min_lease_days: 31}
])

addresses = Address.create([
  {listing_id: 1, line_1: "Folsom St", line_2: "5th St", city: "San Francisco", state: "CA", zipcode: "94103", country: "US"},
  {listing_id: 2, line_1: "Folsom", line_2: "4th St", city: "San Francisco", state: "CA", zipcode: "94103", country: "US"}
])

messages = Message.create([
  {listing_id: 1, sender_id: 2, recipient_id: 1, subject: "I'm super intersted in your ad space!", body: "super interested, please send me more info!", start_date: Date.current, end_date: 1.month.from_now.to_date},
  {listing_id: 1, sender_id: 1, recipient_id: 2, subject: "RE:I'm super intersted in your ad space!", body: "Yes! what is your ad's content gonna be about?"}
])