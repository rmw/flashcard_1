class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, presence: true

  has_many :rounds
  has_many :guesses
  has_many :decks, through: :rounds

  def authenticate(password)
    if self.password == (password)
      true
    else
      false
    end
  end
end
