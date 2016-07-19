require "rails_helper"

feature "users can sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user signs out successfully" do
    sign_in
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
