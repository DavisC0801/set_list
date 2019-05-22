require "rails_helper"

RSpec.describe "As a user" do
  before :each do
    artist = Artist.create(name: "Pat The Bunny")
    @song = artist.songs.create(title: "Song for a Netflix Account", length: 186, play_count: 1000000)
    @song_2 = artist.songs.create(title: "Frome Here to Utopia", length: 654, play_count: 1500000)
  end

  describe "when I add a song to my cart" do
    it "displays a message" do
      visit songs_path

      within("#song-#{@song.id}-info") do
        click_button "Add Song"
      end

      expect(page).to have_content("You now have 1 copy of #{@song.title} in your cart.")
    end
  end

  describe "when I add multiple songs to the cart" do
    it "the message is correct" do
      visit songs_path

      within("#song-#{@song.id}-info") do
        click_button "Add Song"
      end

      within("#song-#{@song_2.id}-info") do
        click_button "Add Song"
      end

      within("#song-#{@song.id}-info") do
        click_button "Add Song"
      end

      expect(page).to have_content("You now have 2 copies of #{@song.title} in your cart.")
    end
  end
end
