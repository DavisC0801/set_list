require "rails_helper"

RSpec.describe "User visits categories index page" do
  context "as an admin" do
    it "allows admin to see all user categories" do
      admin = User.create(username: "penelope", password: "boom", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("Admin Categories")
    end
  end

  context "as a default user" do
    it "does not allow the user to see admin categories index" do
      user = User.create(username: "fern@gully.com", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page.status_code).to eq(404)
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end

  context "as a visitor" do
    it "does not allow visitor to see admin categories" do
      visit admin_categories_path

      expect(page.status_code).to eq(404)
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
