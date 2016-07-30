require "rails_helper"

feature "user updates account information" do
  let!(:user) { FactoryGirl.create(:user, password: "password") }

  scenario "user visits edit page and successfully updates email" do
    sign_in

    click_link "Edit Profile"
    fill_in "Email", with: "test3@gmail.com"
    fill_in "Current password", with: "password"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
  scenario "user visits edit page and successfully updates password" do
    sign_in

    click_link "Edit Profile"
    fill_in "Email", with: "user.email"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "Current password", with: "password"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
  scenario "user visits edit page and unsuccessfully updates password" do
    sign_in

    click_link "Edit Profile"
    fill_in "Email", with: "user.email"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password1"
    fill_in "Current password", with: "password"
    click_button "Update"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
