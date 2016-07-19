require "rails_helper"

feature "user deletes their account" do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "user visits the edit page to delete their account" do
    sign_in

    click_link "Edit"
    expect(page).to have_current_path("/users/edit")

    click_button "Cancel my account"
    expect(page).to have_content("Bye!")
  end
end
