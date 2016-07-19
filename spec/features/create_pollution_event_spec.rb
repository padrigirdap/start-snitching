require "rails_helper"

feature "users can add shop" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user adds new shop successfully" do
    sign_in
    click_link "Add Pollution Event"
    expect(page).to have_content "Add Event"

    fill_in "Name", with: "Huge Oil Spill"
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    fill_in "State", with: "Massachusetts"
    fill_in "Zip", with: "02111"
    fill_in "Description", with: "Jim caught polluting"

    click_button "Create Event"

    expect(page).to have_content "Event created successfully"
    expect(page).to have_content "Huge Oil Spill"
    expect(page).to have_content "Jim caught polluting"
  end

  scenario "user does not provide proper information for a shop" do
    sign_in
    click_link "Add Pollution Event"

    click_button "Create Event"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
end
