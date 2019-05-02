require "rails_helper"

describe "As a visitor" do
  describe "when I visit the new artist form page" do
    it "I can create a new artist" do
      visit "/artists/new"

      fill_in "Name", with: "Pat the Bunny"
      click_on 'Create Artist'

      expect(current_path).to eq("/artists/#{Artist.last.id}")
    end
  end
end

# As a visitor
# When I visit '/artists/new'
# and I fill in the artist's name
# Then I click 'Create Artist'
# I am redirected to this new artists show page
