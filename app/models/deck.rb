class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :guesses, through: :rounds
end
