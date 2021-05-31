# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flower.create(name: 'Dunno',description: 'Still dunno this!').image.attach(io: File.open('app/assets/images/flw1.jpg'),filename: 'flw1')
Flower.create(name: 'Test',description: 'Test dunno this!').image.attach(io: File.open('app/assets/images/flw2.jpg'),filename: 'flw1')
Flower.create(name: 'Dunno2',description: 'Dunno2 dunno this!').image.attach(io: File.open('app/assets/images/flw2.jpg'),filename: 'flw1')
Flower.create(name: 'Test2',description: 'Test2 dunno this!').image.attach(io: File.open('app/assets/images/flw1.jpg'),filename: 'flw1')
Flower.create(name: 'Marijuana',description: 'Marijuana dunno this!').image.attach(io: File.open('app/assets/images/mar.jpg'),filename: 'flw1')
Flower.create(name: 'Marijuana2',description: 'Marijuana2 dunno this!').image.attach(io: File.open('app/assets/images/mar.jpg'),filename: 'flw1')
Flower.create(name: 'Test3',description: 'Test3 dunno this!').image.attach(io: File.open('app/assets/images/flw2.jpg'),filename: 'flw1')
Flower.create(name: 'Dunno3',description: 'Dunno3 dunno this!').image.attach(io: File.open('app/assets/images/flw1.jpg'),filename: 'flw1')
Flower.create(name: 'Dunno4',description: 'Dunno4 dunno this!').image.attach(io: File.open('app/assets/images/flw2.jpg'),filename: 'flw1')
Flower.create(name: 'Test4',description: 'Test4 dunno this!').image.attach(io: File.open('app/assets/images/mar.jpg'),filename: 'flw1')