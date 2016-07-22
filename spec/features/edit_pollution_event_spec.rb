require "rails_helper"

feature "user edits a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:pollution_event) { FactoryGirl.create(:pollution_event, user_id: user.id) }

  scenario "user succesffully edits a pollution event from the pollution event show page" do
    sign_in
    visit pollution_event_path(pollution_event)
    click_link "Edit Event"
    expect(page).to have_current_path edit_pollution_event_path(pollution_event)

    fill_in "Title", with: "Paddy's big spill"
    click_button("Update Event")

    expect(page).to have_content("Paddy's big spill")
    expect(page).to have_content("Event updated!")
    expect(page).to have_current_path pollution_event_path(pollution_event)
  end

  scenario "user unsuccessfully tries to edit a pollution_event" do
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit pollution_event_path(pollution_event)
    expect(page).not_to have_content "Edit Event"
  end

  scenario "user enters invalid information" do
    sign_in
    visit edit_pollution_event_path(pollution_event)

    fill_in "Title", with: ""
    fill_in "Address", with: ""
    click_button("Update Event")

    expect(page).to have_current_path pollution_event_path(pollution_event)

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).not_to have_content("pollution_event updated!")
  end
end
