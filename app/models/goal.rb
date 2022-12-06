class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle
  has_many :habits, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates_length_of :habits, maximum: 5
end
