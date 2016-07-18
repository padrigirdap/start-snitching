require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:pollution_event_id) }
  it { is_expected.to validate_presence_of(:body) }
end
