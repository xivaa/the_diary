class Goal < ApplicationRecord
  belongs_to :user
  has_many :habits

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
