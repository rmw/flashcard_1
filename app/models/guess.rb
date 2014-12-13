class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  belongs_to :card
  #
  def right_wrong(answer)
    if self.card.answer == (answer)

      # test stuff
      #self.card.guess.first.correct = true
      true
    else
      false
    end
  end
end
