require "rails_helper"

feature "users can sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user visits root_path and signs in successfully" do
    sign_in
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "user provides invalid credentials and fails to sign in" do
    visit root_path
    click_link "Sign In"
    fill_in "Username", with: "top"
    click_button "Log in"
    expect(page).to have_content("Invalid Username or password.")
    expect(page).to have_content("Sign In")
  end
end