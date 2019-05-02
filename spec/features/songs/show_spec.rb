require "rails_helper"

RSpec.describe "as a visitor" do

  before :each do
    talking_heads = Artist.create(name: "Talking Heads")
    @she_was = talking_heads.songs.create(title: "And She Was", length: 234, play_count: 123456)
    @wild_life = talking_heads.songs.create(title: "Wild Wild Life", length: 456, play_count: 675910)
  end

  describe "when I visit a songs show page" do
    it "I see that song's title and artist" do
      visit "/songs/#{@she_was.id}"

      expect(page).to have_content(@she_was.title)
      expect(page).to have_content("By: #{@she_was.artist.name}")
      expect(page).to_not have_content(@wild_life.title)
    end
  end
end

# As a visitor
# When I visit /songs/1 (where 1 is the id of a song in my database)
# Then I see that song's title, and artist
# And I do not see any of the other songs in my database
