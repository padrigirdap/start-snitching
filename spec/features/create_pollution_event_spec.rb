require "rails_helper"

feature "users can add shop" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user adds new shop successfully" do
    sign_in
    click_link "Add Event"
    expect(page).to have_content "Add Event"

    fill_in "Title", with: "Huge Oil Spill"
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "Description", with: "Jim caught polluting"
    fill_in "Url", with: "www.cnn.com"
    fill_in "Latitude", with: "4"
    fill_in "Longitude", with: "4"

    click_button "Create Event"

    expect(page).to have_content "Event created successfully"
    expect(page).to have_content "Huge Oil Spill"
    expect(page).to have_content "Jim caught polluting"
  end

  scenario "user does not provide proper information for a shop" do
    sign_in
    click_link "Add Event"

    click_button "Create Event"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Address can't be blank"
  end
end
