require "rails_helper"

RSpec.describe "As a visitor" do
  describe "when I visit '/'" do
    it "creates new user" do
      visit root_path

      click_on "Register as User"

      expect(current_path).to eq(new_user_path)

      fill_in "User Name", with: "funbucket13"
      fill_in "Password", with: "test"

      click_on "Create User"

      new_user = User.last

      expect(page).to have_content("Welcome #{new_user.user_name}!")
    end
  end
end
