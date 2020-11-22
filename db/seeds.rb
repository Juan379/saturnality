# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Comuna.create(name: "Lo Barnechea")
c2 = Comuna.create(name: "Las Condes")
c3 = Comuna.create(name: "El Bosque")
c4 = Comuna.create(name: "Quilicura")
c5 = Comuna.create(name: "San Joaquín")
c6 = Comuna.create(name: "Santiago")

admin = User.create(email: "admin@gmail.com", name: "admin", age: 21, phone: "123123", password:"qwerty")
admin.add_role :admin


u1 = User.create(email: "juan@gmail.com", name: "Juan", age: 21, phone: "123123", password:"qwerty")
u2 = User.create(email: "ami@gmail.com", name: "Ami", age: 21, phone: "123123", password:"qwerty")
u3 = User.create(email: "vicky@gmail.com", name: "Vicky", age: 21, phone: "123123", password:"qwerty")
u4 =User.create(email: "jose@gmail.com", name: "Jose", age: 21, phone: "123123", password:"qwerty")
u5 =User.create(email: "nico@gmail.com", name: "Nico", age: 21, phone: "123123", password:"qwerty")
u6 =User.create(email: "sofia@gmail.com", name: "Sofia", age: 21, phone: "123123", password:"qwerty")
u7 =User.create(email: "clemente@gmail.com", name: "Clemente", age: 21, phone: "123123", password:"qwerty")


Party.create(title: "JuanP1", description: "Juan Party n1", address: "123123", capacity: 123, cost: 12500, comuna: c1, user: u1)
Party.create(title: "JmiP1", description: "Juan Party n2", address: "123123", capacity: 123, cost: 12500, comuna: c6, user: u1)
Party.create(title: "AmiP1", description: "Ami Party n1", address: "123123", capacity: 123, cost: 12500, comuna: c2, user: u2)
Party.create(title: "AmiP2", description: "Ami Party n2", address: "123123", capacity: 123, cost: 12500, comuna: c4, user: u2)
Party.create(title: "VickyP1", description: "Vicky Party n1", address: "123123", capacity: 123, cost: 12500, comuna: c4, user: u3)
Party.create(title: "VickyP2", description: "Vicky Party n2", address: "123123", capacity: 123, cost: 12500, comuna: c5, user: u3)
Party.create(title: "JoseP1", description: "Jose Party n1", address: "123123", capacity: 123, cost: 12500, comuna: c1, user: u4)
Party.create(title: "JoseP2", description: "Jose Party n2", address: "123123", capacity: 123, cost: 12500, comuna: c3, user: u4)