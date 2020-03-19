# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item_seed_data = [
  {
    name: "GJÖRA",
    image_url: "https://www.ikea.com/us/en/images/products/gjoera-bed-frame__0524587_PE644399_S5.JPG?f=s",
    description: "Bed frame, birch, Eidfjord, Queen",
    price: "429.00",
    more_info_url: "https://www.ikea.com/us/en/p/gjoera-bed-frame-birch-eidfjord-s09210616/"
  },
  {
    name: "BJÖRKSNÄS",
    image_url: "https://www.ikea.com/us/en/images/products/bjoerksnaes-bed-frame__0629696_PE694429_S5.JPG?f=s",
    description: "Bed frame, birch, Luröy, King",
    price: "549.00",
    more_info_url: "https://www.ikea.com/us/en/p/bjoerksnaes-bed-frame-birch-luroey-s09247573/xyz"
  }
]

item_seed_data.each do | item_data |
  item = Item.find_by(
    name: item_data[:name], 
    more_info_url: item_data[:more_info_url]
  )
  if !item
    Item.create(item_data)
  end
end

# Item.create(
#   name: "SAGSTUA",
#   image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
#   price: "149.00",
#   description: "Bed frame, black, Full",
#   more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
# )

# Item.create(
#   name: "MALM",
#   image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
#   price: "199.00",
#   description: "Bed frame, high, black-brown, Luröy, Queen",
#   more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
# )

# Item.create(
#   name: "BUSKBO",
#   image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
#   price: "130.00",
#   description: "Armchair, rattan",
#   more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
# )

# Item.create(
#   name: "SKOGSTA",
#   image_url: "https://www.ikea.com/us/en/images/products/skogsta-bench__0365463_PE548271_S5.JPG?f=s",
#   price: "79.00",
#   description: "Bench, acacia, 47 1/4 \"",
#   more_info_url: "https://www.ikea.com/us/en/p/skogsta-bench-acacia-30297957/"
# )

# Item.create(
#   name: "KNOPPARP",
#   image_url: "https://www.ikea.com/us/en/images/products/knopparp-3-seat-sofa__0713945_PE729859_S5.JPG?f=s",
#   price: "149.00",
#   description: "Sofa, Knisa light gray",
#   more_info_url: "https://www.ikea.com/us/en/p/knopparp-sofa-knisa-light-gray-20424625/"
# )

# Item.create(
#   name: "STRANDMON", 
#   image_url: "https://www.ikea.com/us/en/images/products/strandmon-wing-chair__0761768_PE751434_S5.JPG?f=s",
#   price: "249.00", 
#   description: "Wing chair, Vibberbo black/beige",
#   more_info_url: "https://www.ikea.com/us/en/p/strandmon-wing-chair-vibberbo-black-beige-40456960/"
# )

# Item.create(
#   name: "BEINSTA",
#   image_url: "https://www.ikea.com/us/en/images/products/bingsta-armchair__0793271_PE765307_S5.JPG?f=s",
#   description: "Armchair, Vissle dark gray, Kabusa dark gray",
#   price: "129.00",
#   more_info_url: "https://www.ikea.com/us/en/p/bingsta-armchair-vissle-dark-gray-kabusa-dark-gray-40454230/"
# )  

# Item.create(
#   name: "HAVSTEN",
#   image_url: "https://www.ikea.com/us/en/images/products/havsten-3-seat-sofa-in-outdoor__0668272_PE714338_S5.JPG?f=s",
#   description: "Sofa, in/outdoor, orange, beige, 102 3/8x37x35 3/8",
#   price: "750.00",
#   more_info_url: "https://www.ikea.com/us/en/p/havsten-sofa-in-outdoor-orange-beige-s89282628/"
# )

# Item.create(
#   name: "EKTORP",
#   image_url: "https://www.ikea.com/us/en/images/products/ektorp-three-seat-sofa__0386819_PE559167_S5.JPG?f=s",
#   description: "Sofa, Lofallet beige",
#   price: "319.00",
#   more_info_url: "https://www.ikea.com/us/en/p/ektorp-sofa-lofallet-beige-s89129207/"
# )

# Item.create(
#   name: "BRÅTHULT",
#   image_url: "https://www.ikea.com/us/en/images/products/brathult-corner-sofa-3-seat__0524905_PE644631_S5.JPG?f=s",
#   description: "Sectional, 3-seat corner, Vissle red/orange",
#   price: "279.00",
#   more_info_url: "https://www.ikea.com/us/en/p/brathult-sectional-3-seat-corner-vissle-red-orange-s29217829/"
# )
  
# Item.create(
#   name: "SÖDERHAMN",
#   image_url: "https://www.ikea.com/us/en/images/products/soederhamn-4-seat-sofa__0666467_PE713558_S5.JPG?f=s",
#   description: "Sectional, 4-seat, with chaise, Finnsta turquoise",
#   price: "647.00",
#   more_info_url: "https://www.ikea.com/us/en/p/soederhamn-sectional-4-seat-with-chaise-finnsta-turquoise-s79284350/"
# )

# Item.create(
#   name: "VIMLE",
#   image_url: "https://www.ikea.com/us/en/images/products/vimle-3-seat-sofa__0514366_PE639439_S5.JPG?f=s",
#   description: "Sofa, Gunnared beige",
#   price: "649.00",
#   more_info_url: "https://www.ikea.com/us/en/p/vimle-sofa-gunnared-beige-s19284744/"
# )


# Item.create(
#   name: "NORDLI",
#   image_url: "https://www.ikea.com/us/en/images/products/nordli-bed-frame-w-storage-and-headboard__0749133_PE745502_S5.JPG?f=s",
#   description: "Bed with headboard and storage, anthracite, Queen",
#   price: "529.00",
#   more_info_url: "https://www.ikea.com/us/en/p/nordli-bed-with-headboard-and-storage-anthracite-s39241409/"
# )

# Item.create(
#   name: "SAGSTUA", 
#   image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783218_PE761516_S5.JPG?f=s",
#   description: "Bed frame, white, Full",
#   price: "149.00",
#   more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-white-s49254203/"
# )

# Item.create(
#   name: "HEMNES",
#   image_url: "https://www.ikea.com/us/en/images/products/hemnes-day-bed-frame-with-3-drawers__0636371_PE697851_S5.JPG?f=s",
#   description: "Daybed frame with 3 rawers, white, Twin",
#   price: "299.00",
#   more_info_url: "https://www.ikea.com/us/en/p/hemnes-daybed-frame-with-3-drawers-white-30349329/"
# )

# Item.create(
#   name: "BJÖRKSNÄS",
#   image_url: "https://www.ikea.com/us/en/images/products/bjoerksnaes-bed-frame__0629696_PE694429_S5.JPG?f=s",
#   description: "Bed frame, birch, Luröy, King",
#   price: "549.00",
#   more_info_url: "https://www.ikea.com/us/en/p/bjoerksnaes-bed-frame-birch-luroey-s09247573/"
# )

# Item.create(
#   name: "GJÖRA",
#   image_url: "https://www.ikea.com/us/en/images/products/gjoera-bed-frame__0524587_PE644399_S5.JPG?f=s",
#   description: "Bed frame, birch, Eidfjord, Queen",
#   price: "429.00",
#   more_info_url: "https://www.ikea.com/us/en/p/gjoera-bed-frame-birch-eidfjord-s09210616/"
# )

# # Item.create(
# #   name: "",
# #   image_url: "",
# #   price: "",
# #   description: "",
# #   more_info_url: ""
# # )