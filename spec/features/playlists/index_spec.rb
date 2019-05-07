require "rails_helper"

RSpec.describe "the playlist index page" do
  before :each do
    @playlist_1 = Playlist.create(name: "Classic Rock")
    @playlist_2 = Playlist.create(name: "Country")
    @playlist_3 = Playlist.create(name: "Favorite Jams")

    artist_1 = Artist.create(name: "Talking Heads")
    artist_2 = Artist.create(name: "Journey")
    artist_3 = Artist.create(name: "Zac Brown Band")

    @song_1 = @playlist_1.songs.create!(title: "This Must Be The Place", length: 832, play_count: 83209, artist: artist_1)
    @song_2 = @playlist_1.songs.create!(title: "Heaven", length: 342, play_count: 85509, artist: artist_1)
    @song_3 = @playlist_1.songs.create!(title: "Don't Stop Beliving", length: 282, play_count: 809, artist: artist_2)
    @song_4 = artist_3.songs.create!(title: "Chicken Fried", length: 432, play_count: 743)
    @playlist_2.songs << @song_4
    @playlist_3.songs.push(@song_1)
    PlaylistSong.create(song: @song_4, playlist: @playlist_3)
  end

  it "should display all playlists" do
    visit "/playlists"

    within("#playlist-#{@playlist_1.id}") do
      within("#song-#{@song_1.id}")do
        expect(page).to have_content(@song_1.title)
      end
      within("#song-#{@song_2.id}")do
        expect(page).to have_content(@song_2.title)
      end
      within("#song-#{@song_3.id}")do
        expect(page).to have_content(@song_3.title)
      end
    end

    within("#playlist-#{@playlist_2.id}") do
      within("#song-#{@song_4.id}")do
        expect(page).to have_content(@song_4.title)
      end
    end

    within("#playlist-#{@playlist_3.id}") do
      within("#song-#{@song_1.id}")do
        expect(page).to have_content(@song_1.title)
      end
      within("#song-#{@song_4.id}")do
        expect(page).to have_content(@song_4.title)
      end
    end

  end
end
