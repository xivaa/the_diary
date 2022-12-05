class User < ApplicationRecord
  has_many :goals
  has_many :puzzles
  has_many :habits, through: :goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
