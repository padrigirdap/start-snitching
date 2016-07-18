require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:encrypted_password) }
  it { is_expected.to have_valid(:username).when("Paddy") }
  it { is_expected.to_not have_valid(:username).when(nil, "") }
  it { is_expected.to have_valid(:email).when("Paddy@gmail.com") }
  it { is_expected.to_not have_valid(:email).when(nil, "") }
  it { is_expected.to_not have_valid(:encrypted_password).when(nil, "") }
end
