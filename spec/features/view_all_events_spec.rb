require "rails_helper"

feature "user deletes a pollution_event" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:pollution_event) { FactoryGirl.create(:pollution_event, user_id: user.id) }

  scenario "User deletes a pollution vent from the pollution event edit page" do
    visit root_path

    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"

    expect(page).to have_current_path("/")
    expect(page).to have_content pollution_event.title
  end

  scenario "user unsuccessfully deletes another user's pollution_event" do
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit pollution_event_path(pollution_event)
    expect(page).not_to have_content "Edit Event"
  end
end
