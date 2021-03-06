require "rails_helper"

feature "user deletes a pollution_event" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:pollution_event) { FactoryGirl.create(:pollution_event, user_id: user.id) }

  scenario "User deletes a pollution vent from the pollution event edit page" do
    sign_in

    visit edit_pollution_event_path(pollution_event)
    click_button "Delete Event"

    expect(page).to have_content "Event deleted!"
    expect(page).to have_current_path pollution_events_path
    expect(page).not_to have_content pollution_event.title
  end

  scenario "user unsuccessfully deletes another user's pollution_event" do

    sign_in_two
    visit pollution_event_path(pollution_event)
    expect(page).not_to have_content "Edit pollution_event"
  end
end
