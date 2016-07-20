class User < ActiveRecord::Base
  has_many :pollution_events
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
