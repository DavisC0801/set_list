require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  before :each do
    test = Artist.create(name: "tests")
    @song_1 = test.songs.create(title: "Don't Stop Belivin'", length: 303, play_count: 123456)
    @song_2 = test.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 987654321)

  end

  it "user can see all songs" do
    visit "/songs"

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content("Play Count: #{@song_1.play_count}")
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content("Play Count: #{@song_2.play_count}")
  end

  it "has links to song show pages" do
    visit "/songs"

    expect(page).to have_link(@song_1.title)

    click_link @song_1.title

    expect(current_path).to eq("/songs/#{@song_1.id}")
    expect(page).to have_content(@song_1.title)
  end
end
