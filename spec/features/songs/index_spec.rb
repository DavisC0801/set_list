require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  # before :each do
  #   test = Artist.create(name: "tests")
  #   artist = Artist.create!(name: '1903')
  #   @song_1 = test.songs.create(title: "Don't Stop Belivin'", length: 303, play_count: 123456)
  #   @song_2 = test.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 987654321)
  #   @song_3 = artist.songs.create(title: 'Testing', length: 90, play_count: 1)
  #   @song_4 = artist.songs.create(title: 'Testing Redux', length: 90, play_count: 10)
  # end

  before :each do
    artist = create(:artist)
    # @song = create(:song, artist: artist)
    @song_1, @song_2, @song_3, @song_4 = create_list(:song, 4, artist: artist)
    #can assign Ivars using this syntax
  end

  it "user can see all songs" do
    visit "/songs"

    within("#song-#{@song_1.id}-info") do
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content("Play Count: #{@song_1.play_count}")
    end
    within("#song-#{@song_2.id}-info") do
      expect(page).to have_content(@song_2.title)
      expect(page).to have_content("Play Count: #{@song_2.play_count}")
    end
  end

  it "has links to song show pages" do
    visit "/songs"

    expect(page).to have_link(@song_1.title)

    click_link @song_1.title

    expect(current_path).to eq("/songs/#{@song_1.id}")
    expect(page).to have_content(@song_1.title)
  end

  it 'shows song information grouped by length' do
    visit "/songs"

    within("#song-#{@song_3.id}-info") do
      expect(page).to have_link(@song_3.title)
      expect(page).to have_content("Play Count: #{@song_3.play_count}")
      expect(page).to have_content("Length: #{@song_3.length}")
    end

    within("#song-#{@song_4.id}-info") do
      expect(page).to have_link(@song_4.title)
      expect(page).to have_content("Play Count: #{@song_4.play_count}")
      expect(page).to have_content("Length: #{@song_4.length}")
    end

    within("#song-#{@song_3.id}-info") do
      click_link(@song_3.title)
    end

    expect(page.current_path).to eq("/songs/#{@song_3.id}")
  end
end
