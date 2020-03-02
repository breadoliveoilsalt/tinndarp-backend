# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(
  name: "SAGSTUA",
  image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
  price: "149.00",
  description: "Bed frame, black, Full")

Item.create(
  name: "MALM",
  image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
  price: "199.00",
  description: "Bed frame, high, black-brown, Luröy, Queen"
)

Item.create(
  name: "BUSKBO",
  image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
  price: "130.00",
  description: "Armchair, rattan"
)

Item.create(
  name: "SKOGSTA",
  image_url: "https://www.ikea.com/us/en/images/products/skogsta-bench__0365463_PE548271_S5.JPG?f=s",
  price: "79.00",
  description: "Bench, acacia, 47 1/4 \""
)

Item.create(
  name: "KNOPPARP",
  image_url: "https://www.ikea.com/us/en/images/products/knopparp-3-seat-sofa__0713945_PE729859_S5.JPG?f=s",
  price: "149.00",
  description: "Sofa, Knisa light gray"
)
