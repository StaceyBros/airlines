# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "-+"*10
Airplane.destroy_all
a1 = Airplane.create :name => 'Boeing 747-400', :rows => 10, :columns => 4
a2 = Airplane.create :name => 'Boeing 777-300', :rows => 8, :columns => 3
a3 = Airplane.create :name => 'Airbus A380-800', :rows => 4, :columns => 4
puts "#{Airplane.count} airplanes has been created\n"

puts "-+"*10
Flight.destroy_all
f1 = Flight.create :number => '23', :origin => 'SYD', :destination => 'MEL', :date => '2020-11-02'
f2 = Flight.create :number => '87', :origin => 'SYD', :destination => 'TMW', :date => '2020-09-03'
f3 = Flight.create :number => '09', :origin => 'MEL', :destination => 'SYD', :date => '2020-08-04'
f4 = Flight.create :number => '13', :origin => 'TMW', :destination => 'MEL', :date => '2020-12-05'
f5 = Flight.create :number => '11', :origin => 'MEL', :destination => 'TMW', :date => '2021-01-06'
f6 = Flight.create :number => '11', :origin => 'TMW', :destination => 'SYD', :date => '2021-02-06'
puts "#{Flight.count} flights has been created\n"

puts "-+"*10
Reservation.destroy_all
r1 = Reservation.create :seat => '1'
r2 = Reservation.create :seat => '2'
r3 = Reservation.create :seat => '3'
r4 = Reservation.create :seat => '4'
r5 = Reservation.create :seat => '5'
r6 = Reservation.create :seat => '6'
puts "#{Reservation.count} reservations has been created\n"

puts "-+"*10
User.destroy_all
u1 = User.create :email => 'admin@ga.com', :password => 'chicken', :admin => true, :name => 'Admin'
u2 = User.create :email => 'admin1@ga.com', :password => 'chicken', :admin => true, :name => 'Admin'
u3 = User.create :email => 'admin2@ga.com', :password => 'chicken', :admin => true, :name => 'Admin'
u4 = User.create :email => 'farid@ga.com', :password => 'chicken', :name => 'Farid'
u5 = User.create :email => 'jasper@ga.com', :password => 'chicken', :name => 'Jasper'
u6 = User.create :email => 'stacey@ga.com', :password => 'chicken', :name => 'Stacey'
puts "#{User.count} users has been created\n"

puts "-+"*10
puts "associations\n"

a1.flights << f1 << f2
a2.flights << f3 << f4
a3.flights << f5
puts "aireplane and flights\n"
puts "-+"*10

u1.reservations << r1
u2.reservations << r2
u3.reservations << r3
u4.reservations << r4
u5.reservations << r5
u6.reservations << r6
puts "users and reservation"
puts "-+"*10

u1.flights << f1
u2.flights << f2
u3.flights << f3
u4.flights << f4
u5.flights << f5
u6.flights << f6
puts "users and flights"
puts "-+"*10

f1.reservations << r1
f2.reservations << r2
f3.reservations << r3
f4.reservations << r4
f5.reservations << r5
f6.reservations << r6
puts "reservation and flights"
puts "-+"*10
