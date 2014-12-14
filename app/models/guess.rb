class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  belongs_to :card

  def right_wrong?(answer)
      if self.cards.answer == answer

        # this work in the console
        # self.rounds.first.guesses.first.correct = true
        true
      else
        false
      end
   end

end
