class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :pollution_event

  validates :body, presence: true
  validates :user_id, presence: true
  validates :pollution_event_id, presence: true
end
