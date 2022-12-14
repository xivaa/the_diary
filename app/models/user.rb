class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :puzzles, dependent: :destroy
  has_many :habits, through: :goals
  has_many :notes, dependent: :destroy
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
