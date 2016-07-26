require "coveralls"
require "factory_girl_rails"
Coveralls.wear!('rails')
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def sign_in
  visit root_path
  click_link "Sign In"
  within(:css, "div#sign-in") do
  fill_in 'Username', with: user.username
  fill_in "Password", with: user.password
  end
  click_button "Sign In"
end

def sign_in_two
  user2 = FactoryGirl.create(:user)
  visit root_path
  click_link "Sign In"
  within(:css, "div#sign-in") do
  fill_in 'Username', with: user2.username
  fill_in "Password", with: user2.password
  end
  click_button "Sign In"
end
