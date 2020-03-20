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
  },
  {
    name: "SAGSTUA",
    image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783215_PE761511_S5.JPG?f=s",
    price: "149.00",
    description: "Bed frame, black, Full",
    more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-black-s59268898/"
  },
  {
    name: "MALM",
    image_url: "https://www.ikea.com/us/en/images/products/malm-bed-frame-high__0637598_PE698416_S5.JPG?f=s",
    price: "199.00",
    description: "Bed frame, high, black-brown, Luröy, Queen",
    more_info_url: "https://www.ikea.com/us/en/p/malm-bed-frame-high-black-brown-luroey-s69009475/"
  },
  {
    name: "BUSKBO",
    image_url: "https://www.ikea.com/us/en/images/products/buskbo-armchair__0700959_PE723853_S5.JPG?f=s",
    price: "130.00",
    description: "Armchair, rattan",
    more_info_url: "https://www.ikea.com/us/en/p/buskbo-armchair-rattan-70434311/"
  },
  {
    name: "SKOGSTA",
    image_url: "https://www.ikea.com/us/en/images/products/skogsta-bench__0365463_PE548271_S5.JPG?f=s",
    price: "79.00",
    description: "Bench, acacia, 47 1/4 \"",
    more_info_url: "https://www.ikea.com/us/en/p/skogsta-bench-acacia-30297957/"
  },
  {
    name: "KNOPPARP",
    image_url: "https://www.ikea.com/us/en/images/products/knopparp-3-seat-sofa__0713945_PE729859_S5.JPG?f=s",
    price: "149.00",
    description: "Sofa, Knisa light gray",
    more_info_url: "https://www.ikea.com/us/en/p/knopparp-sofa-knisa-light-gray-20424625/"
  },
  {
    name: "STRANDMON", 
    image_url: "https://www.ikea.com/us/en/images/products/strandmon-wing-chair__0761768_PE751434_S5.JPG?f=s",
    price: "249.00", 
    description: "Wing chair, Vibberbo black/beige",
    more_info_url: "https://www.ikea.com/us/en/p/strandmon-wing-chair-vibberbo-black-beige-40456960/"
  },
  {
    name: "BEINSTA",
    image_url: "https://www.ikea.com/us/en/images/products/bingsta-armchair__0793271_PE765307_S5.JPG?f=s",
    description: "Armchair, Vissle dark gray, Kabusa dark gray",
    price: "129.00",
    more_info_url: "https://www.ikea.com/us/en/p/bingsta-armchair-vissle-dark-gray-kabusa-dark-gray-40454230/"
  }, 
  {
    name: "HAVSTEN",
    image_url: "https://www.ikea.com/us/en/images/products/havsten-3-seat-sofa-in-outdoor__0668272_PE714338_S5.JPG?f=s",
    description: "Sofa, in/outdoor, orange, beige, 102 3/8x37x35 3/8",
    price: "750.00",
    more_info_url: "https://www.ikea.com/us/en/p/havsten-sofa-in-outdoor-orange-beige-s89282628/"
  },
  {
    name: "EKTORP",
    image_url: "https://www.ikea.com/us/en/images/products/ektorp-three-seat-sofa__0386819_PE559167_S5.JPG?f=s",
    description: "Sofa, Lofallet beige",
    price: "319.00",
    more_info_url: "https://www.ikea.com/us/en/p/ektorp-sofa-lofallet-beige-s89129207/"
  },
  {
    name: "BRÅTHULT",
    image_url: "https://www.ikea.com/us/en/images/products/brathult-corner-sofa-3-seat__0524905_PE644631_S5.JPG?f=s",
    description: "Sectional, 3-seat corner, Vissle red/orange",
    price: "279.00",
    more_info_url: "https://www.ikea.com/us/en/p/brathult-sectional-3-seat-corner-vissle-red-orange-s29217829/"
  },
  {
    name: "SÖDERHAMN",
    image_url: "https://www.ikea.com/us/en/images/products/soederhamn-4-seat-sofa__0666467_PE713558_S5.JPG?f=s",
    description: "Sectional, 4-seat, with chaise, Finnsta turquoise",
    price: "647.00",
    more_info_url: "https://www.ikea.com/us/en/p/soederhamn-sectional-4-seat-with-chaise-finnsta-turquoise-s79284350/"
  },
  {
    name: "VIMLE",
    image_url: "https://www.ikea.com/us/en/images/products/vimle-3-seat-sofa__0514366_PE639439_S5.JPG?f=s",
    description: "Sofa, Gunnared beige",
    price: "649.00",
    more_info_url: "https://www.ikea.com/us/en/p/vimle-sofa-gunnared-beige-s19284744/"
  },
  {
    name: "NORDLI",
    image_url: "https://www.ikea.com/us/en/images/products/nordli-bed-frame-w-storage-and-headboard__0749133_PE745502_S5.JPG?f=s",
    description: "Bed with headboard and storage, anthracite, Queen",
    price: "529.00",
    more_info_url: "https://www.ikea.com/us/en/p/nordli-bed-with-headboard-and-storage-anthracite-s39241409/"
  },
  {
    name: "SAGSTUA", 
    image_url: "https://www.ikea.com/us/en/images/products/sagstua-bed-frame__0783218_PE761516_S5.JPG?f=s",
    description: "Bed frame, white, Full",
    price: "149.00",
    more_info_url: "https://www.ikea.com/us/en/p/sagstua-bed-frame-white-s49254203/"
  },
  {
    name: "HEMNES",
    image_url: "https://www.ikea.com/us/en/images/products/hemnes-day-bed-frame-with-3-drawers__0636371_PE697851_S5.JPG?f=s",
    description: "Daybed frame with 3 rawers, white, Twin",
    price: "299.00",
    more_info_url: "https://www.ikea.com/us/en/p/hemnes-daybed-frame-with-3-drawers-white-30349329/"
  },
  {
    name: "BJÖRKSNÄS",
    image_url: "https://www.ikea.com/us/en/images/products/bjoerksnaes-bed-frame__0629696_PE694429_S5.JPG?f=s",
    description: "Bed frame, birch, Luröy, King",
    price: "549.00",
    more_info_url: "https://www.ikea.com/us/en/p/bjoerksnaes-bed-frame-birch-luroey-s09247573/"
  },
  {
    name: "GJÖRA",
    image_url: "https://www.ikea.com/us/en/images/products/gjoera-bed-frame__0524587_PE644399_S5.JPG?f=s",
    description: "Bed frame, birch, Eidfjord, Queen",
    price: "429.00",
    more_info_url: "https://www.ikea.com/us/en/p/gjoera-bed-frame-birch-eidfjord-s09210616/"
  },
  {
    name: "SLATTUM",
    image_url: "https://www.ikea.com/us/en/images/products/slattum-upholstered-bed-frame__0768245_PE754387_S5.JPG?f=s",
    description: "Upholstered bed frame, Knisa light gray, Twin",
    price: "99.00",
    more_info_url: "https://www.ikea.com/us/en/p/slattum-upholstered-bed-frame-knisa-light-gray-80450126/"
  },
  {
    name: "SLÄKT",
    image_url: "https://www.ikea.com/us/en/images/products/slaekt-bed-frame-w-storage-slatted-bedbase__0648346_PE704865_S5.JPG?f=s",
    description: "Bed frame w/storage+slatted bedbase, white, Twin",
    price: "279.00",
    more_info_url: "https://www.ikea.com/us/en/p/slaekt-bed-frame-w-storage-slatted-bedbase-white-s99291991/"
  },
  {
    name: "SANDARED",
    image_url: "https://www.ikea.com/us/en/images/products/sandared-pouffe__0560902_PE662686_S5.JPG?f=s",
    description: "Pouffe, beige, 17 3/4",
    price: "49.00",
    more_info_url: "https://www.ikea.com/us/en/p/sandared-pouffe-beige-20385313/"
  },
  {
    name: "STRANDMON",
    image_url: "https://www.ikea.com/us/en/images/products/strandmon-footstool__0761765_PE751432_S5.JPG?f=s",
    description: "Ottoman, Vibberbo black/beige",
    price: "69.00",
    more_info_url: "https://www.ikea.com/us/en/p/strandmon-ottoman-vibberbo-black-beige-50456969/"
  },
  {
    name: "VIMLE",
    image_url: "https://www.ikea.com/us/en/images/products/vimle-footstool-with-storage__0514353_PE639449_S5.JPG?f=s",
    description: "Ottoman with storage, Gunnared medium gray",
    price: "",
    more_info_url: "https://www.ikea.com/us/en/p/vimle-ottoman-with-storage-gunnared-medium-gray-s99285495/"
  },
  {
    name: "POÄNG",
    image_url: "https://www.ikea.com/us/en/images/products/poaeng-footstool__0497275_PE629066_S5.JPG?f=s",
    description: "Ottoman, birch veneer, Hillared anthracite",
    price: "65.00",
    more_info_url: "https://www.ikea.com/us/en/p/poaeng-ottoman-birch-veneer-hillared-anthracite-s99305950/"
  },
  {
    name: "MICKE",
    image_url: "https://www.ikea.com/us/en/images/products/micke-desk-white__0736020_PE740347_S5.JPG?f=s",
    description: "Desk, white, 55 7/8x19 5/8",
    price: "79.00",
    more_info_url: "https://www.ikea.com/us/en/p/micke-desk-white-90214308/"
  },
  {
    name: "MATHOPEN",
    image_url: "https://www.ikea.com/us/en/images/products/mathopen-bedside-table__0535662_PE649548_S5.JPG?f=s",
    description: "Nightstand, black-brown, 26 3/8x19 5/8",
    price: "79.00",
    more_info_url: "https://www.ikea.com/us/en/p/mathopen-nightstand-black-brown-70353927/"
  },
  {
    name: "LINNMON / ADILS",
    image_url: "https://www.ikea.com/us/en/images/products/linnmon-adils-table-black-brown-black__0737172_PE740915_S5.JPG?f=s",
    description: "Table, black-brown, black, 47 1/4x23 5/8",
    price: "38.99",
    more_info_url: "https://www.ikea.com/us/en/p/linnmon-adils-table-black-brown-black-s39932562/"
  },
  {
    name: "NORDEN",
    image_url: "https://www.ikea.com/us/en/images/products/norden-gateleg-table-birch__66396_PE179294_S5.JPG?f=s",
    description: "Gateleg table, birch, 10 1/4/35/59 7/8x31 1/2",
    price: "199.00",
    more_info_url: "https://www.ikea.com/us/en/p/norden-gateleg-table-birch-90423887/"
  },
  {
    name: "LINNMON / ALEX",
    image_url: "https://www.ikea.com/us/en/images/products/linnmon-alex-table-white__0737574_PE741174_S5.JPG?f=s",
    description: "Table, white, 78 3/4x23 5/8",
    price: "209.99",
    more_info_url: "https://www.ikea.com/us/en/p/linnmon-alex-table-white-s59932698/"
  },
  {
    name: "KALLAX",
    image_url: "https://www.ikea.com/us/en/images/products/kallax-desk-combination-white__0366702_PE549115_S5.JPG?f=s",
    description: "Workstation, white, 30 3/8x57 7/8x62 5/8",
    price: "131.98",
    more_info_url: "https://www.ikea.com/us/en/p/kallax-workstation-white-s19123063/"
  },
  {
    name: "MICKE",
    image_url: "https://www.ikea.com/us/en/images/products/micke-corner-workstation-black-brown__0734327_PE739443_S5.JPG?f=s",
    description: "Corner workstation, black-brown, 39 3/8x55 7/8",
    price: "149.00",
    more_info_url: "https://www.ikea.com/us/en/p/micke-corner-workstation-black-brown-50244741/"
  },
  {
    name: "NORDKISA",
    image_url: "https://www.ikea.com/us/en/images/products/nordkisa-dressing-table-bamboo__0756073_PE748752_S5.JPG?f=s",
    description: "Dressing table, bamboo, 29 7/8x18 1/2",
    price: "149.00",
    more_info_url: "https://www.ikea.com/us/en/p/nordkisa-dressing-table-bamboo-20439472/" 
  },
  {
    name: "GERTON / ODDVALD",
    image_url: "https://www.ikea.com/us/en/images/products/gerton-oddvald-table-beech-black__0736758_PE740713_S5.JPG?f=s",
    description: "Table, beech, black, 61x29 1/2",
    price: "130.00",
    more_info_url: "https://www.ikea.com/us/en/p/gerton-oddvald-table-beech-black-s29870932/"
  },
  {
    name: "HEMNES",
    image_url: "https://www.ikea.com/us/en/images/products/hemnes-desk__0526711_PE645112_S5.JPG?f=s",
    description: "Desk, dark gray gray stained, 61x25 5/8",
    price: "299.00",
    more_info_url: "https://www.ikea.com/us/en/p/hemnes-desk-dark-gray-gray-stained-30381729/"
  },
  {
    name: "BRYGGJA",
    image_url: "https://www.ikea.com/us/en/images/products/bryggja-chest-of-9-drawers__0778109_PE760066_S5.JPG?f=s",
    description: "9-drawer chest, beige, 46 1/2x36 1/4",
    price: "279.00",
    more_info_url: "https://www.ikea.com/us/en/p/bryggja-9-drawer-chest-beige-90469309/"
  },
  {
    name: "BRIMNES",
    image_url: "https://www.ikea.com/us/en/images/products/brimnes-3-drawer-chest-gray-frosted-glass__0818104_PE774290_S5.JPG?f=s",
    description: "3-drawer chest, gray, frosted glass, 30 3/4x37 3/8",
    price: "129.00",
    more_info_url: "https://www.ikea.com/us/en/p/brimnes-3-drawer-chest-gray-frosted-glass-10470284/"
  },
  {
    name: "HEMNES",
    image_url: "https://www.ikea.com/us/en/images/products/hemnes-chest-of-8-drawers__0627346_PE693299_S5.JPG?f=s",
    description: "8-drawer dresser, white stain, 63x37 3/4",
    price: "199.00",
    more_info_url: "https://www.ikea.com/us/en/p/hemnes-8-drawer-dresser-white-stain-00318598/"
  },
  {
    name: "LENNART",
    image_url: "https://www.ikea.com/us/en/images/products/lennart-drawer-unit-white__0395412_PE564513_S5.JPG?f=s",
    description: "Drawer unit, white",
    price: "14.99",
    more_info_url: "https://www.ikea.com/us/en/p/lennart-drawer-unit-white-30326177/"
  },
  {
    name: "INNERSKÄR",
    image_url: "https://www.ikea.com/us/en/images/products/innerskaer-pouffe-frame-in-outdoor__0759835_PE750514_S5.JPG?f=s",
    description: "Pouffe frame, indoor/outdoor, 22 7/8 ",
    price: "50.00",
    more_info_url: "https://www.ikea.com/us/en/p/innerskaer-pouffe-frame-indoor-outdoor-70445376/"
  },
  {
    name: "GÅRÖ / RISÖ",
    image_url: "https://www.ikea.com/us/en/images/products/garoe-risoe-hammock-with-stand__0562742_PE663585_S5.JPG?f=s",
    description: "Hammock with stand, gray, pale orange",
    price: "95.00",
    more_info_url: "https://www.ikea.com/us/en/p/garoe-risoe-hammock-with-stand-gray-pale-orange-s59251770/"
  },
  {
    name: "HÖGSTEN",
    image_url: "https://www.ikea.com/us/en/images/products/hoegsten-armchair-outdoor-white__0134126_PE290008_S5.JPG?f=s",
    description: "Armchair, outdoor, white",
    price: "99.00",
    more_info_url: "https://www.ikea.com/us/en/p/hoegsten-armchair-outdoor-white-50209865/"
  },
  {
    name: "BROMMÖ",
    image_url: "https://www.ikea.com/us/en/images/products/brommoe-lounger-outdoor-brown-stained__0729482_PE737001_S5.JPG?f=s",
    description: "Chaise, outdoor, brown stained black, brown",
    price: "59.99",
    more_info_url: "https://www.ikea.com/us/en/p/brommoe-chaise-outdoor-brown-stained-black-brown-40332682/"
  },
  {
    name: "ÄPPLARÖ",
    image_url: "https://www.ikea.com/us/en/images/products/aepplaroe-bench-with-backrest-outdoor-brown-stained__0728725_PE736423_S5.JPG?f=s",
    description: "Bench with backrest, outdoor, brown stained brown",
    price: "95.00",
    more_info_url: "https://www.ikea.com/us/en/p/aepplaroe-bench-with-backrest-outdoor-brown-stained-brown-80208529/"
  },
  {
    name: "ÄPPLARÖ / HÖGSTEN",
    image_url: "https://www.ikea.com/us/en/images/products/aepplaroe-hoegsten-table-6-chairs-w-armrests-outdoor__0137732_PE296468_S5.JPG?f=s",
    description: "Table+6 armchairs, outdoor, brown stained brown, white",
    price: "623.00",
    more_info_url: "https://www.ikea.com/us/en/p/aepplaroe-hoegsten-table-6-armchairs-outdoor-brown-stained-brown-white-s09898526/"
  }
]
if ENV['RAILS_ENV'] != "test"
# unless Rails.env.test?
# unless Rails.env.test?
  item_seed_data.each do | item_data |
    item = Item.find_by(
      name: item_data[:name], 
      more_info_url: item_data[:more_info_url]
    )
    if item
      item.update(item_data)
    else
      Item.create(item_data)
    end
  end
end