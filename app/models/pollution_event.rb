class PollutionEvent < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :event_lng, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :event_lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
end
