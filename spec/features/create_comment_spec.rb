require "rails_helper"
feature "user creates a new review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:pollution_event) { FactoryGirl.create(:pollution_event, user_id: user.id, title: "Jim's Spill") }

  scenario "user successfully submits a new comment" do
    sign_in

    click_link "Jim's Spill"
    click_link "Add Comment"

    fill_in "Comment", with: "Jim's a mess"
    click_button "Submit Comment"

    expect(page).to have_content("Jim's a mess")
  end



  scenario "user unsuccessfully submits new comment" do
    sign_in

    click_link "Jim's Spill"
    click_link "Add Comment"

    fill_in "Comment", with: ""
    click_button "Submit Comment"

    expect(page).to have_content("Body can't be blank")
  end
end
