class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  belongs_to :card
  validates :round_id, presence: true
  validates :user_id, presence: true
  validates :card_id, presence: true

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
