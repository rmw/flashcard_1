class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :guesses, through: :rounds

  def right_wrong(answer)
      if self.cards.first.answer == answer

        # this work in the console
        self.rounds.first.guesses.first.correct = true
        true
      else
        false
      end
  end
end
