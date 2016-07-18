require 'rails_helper'

feature "user signs up" do
  scenario "user gives valid and required information" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Start Snitching!")
    expect(page).to have_content("Sign Out")
  end

  scenario "user does not supply required information" do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "users confirmation password is incorrect" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password2"
    click_button "Sign Up"

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Sign Out")

  end
end
