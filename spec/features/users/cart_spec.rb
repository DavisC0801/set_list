require "rails_helper"

RSpec.describe "As a user" do
  describe "when I add a song to my cart" do
    it "displays a message" do
      artist = Artist.create(name: "Pat The Bunny")
      song = artist.songs.create(title: "Song for a Netflix Account", length: 186, play_count: 1000000)

      visit songs_path

      within("#song-#{song.id}-info") do
        click_button "Add Song"
      end

      expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
    end
  end
end
