# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Airport.delete_all
Flight.delete_all
Booking.delete_all
Passenger.delete_all
PassengerBooking.delete_all

a = Airport.create(name: "SFO")
b = Airport.create(name: "NYC")
c = Airport.create(name: "LAX")
d = Airport.create(name: "ATL")

Flight.create(from_airport_id: a.id, to_airport_id: b.id, date: 28.hours.from_now, duration: "5") 
Flight.create(from_airport_id: a.id, to_airport_id: b.id, date: 29.hours.from_now, duration: "5") 
Flight.create(from_airport_id: a.id, to_airport_id: b.id, date: 1.day.from_now, duration: "5") 
Flight.create(from_airport_id: a.id, to_airport_id: b.id, date: 2.days.from_now, duration: "5") 
Flight.create(from_airport_id: a.id, to_airport_id: b.id, date: 3.days.from_now, duration: "5")

Flight.create(from_airport_id: a.id, to_airport_id: c.id, date: 5.hours.from_now, duration: "2") 
Flight.create(from_airport_id: a.id, to_airport_id: c.id, date: 4.days.from_now, duration: "2")

Flight.create(from_airport_id: c.id, to_airport_id: d.id, date: 7.days.from_now, duration: "6") 
Flight.create(from_airport_id: c.id, to_airport_id: d.id, date: 9.days.from_now, duration: "6") 