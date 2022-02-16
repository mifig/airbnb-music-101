# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Album.destroy_all

30.times do
  file = URI.open('https://picsum.photos/200')
  album = Album.new(title: Faker::Music.album, price: rand(5..30), user_id: 1)
  album.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  album.save

  puts "Creating album - #{album.title}"
end
