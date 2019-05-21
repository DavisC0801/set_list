# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Song.destroy_all
Artist.destroy_all

rock = Playlist.create!(name: "Classic Rock")
country = Playlist.create!(name: "Country")
jams = Playlist.create!(name: "Favorite Jams")

talking_heads = Artist.create!(name: "Talking Heads")
journey = Artist.create!(name: "Journey")
zac_brown = Artist.create!(name: "Zac Brown Band")

place = rock.songs.create!(title: "This Must Be The Place", length: 832, play_count: 83209, artist: talking_heads)
heaven = rock.songs.create!(title: "Heaven", length: 832, play_count: 83209, artist: talking_heads)
dont_stop = rock.songs.create!(title: "Don't Stop Believin'", length: 832, play_count: 83209, artist: journey)

chicken = zac_brown.songs.create!(title: "Chicken Fried", length: 4378, play_count: 7453689)
country.songs << chicken
jams.songs << chicken
jams.songs.push(place)
