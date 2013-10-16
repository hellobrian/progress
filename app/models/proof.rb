# == Schema Information
#
# Table name: proofs
#
#  id            :integer          not null, primary key
#  micro_goal_id :integer
#  lesson        :text
#  picture       :binary
#  completed     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Proof < ActiveRecord::Base
  attr_accessible :lesson, :micro_goal_id, :picture
  belongs_to :micro_goal


  validates :lesson, presence: true
  validates :lesson, length: { maximum: 140 }

  after_create :valid_proof
  after_create :points_completion_micro_goal
  after_create :points_completion_goal?

private

  def valid_proof
    self.micro_goal.completed = true
    self.micro_goal.save
  end

  # Add 5 points when a micro_goal is completed
  def points_completion_micro_goal
    self.micro_goal.goal.points += 5
    self.micro_goal.goal.save
  end

  def points_completion_goal?
      goal = self.micro_goal.goal
      if
        goal.micro_goals.include?(completed: nil)
        return
      else
        goal.points += 20
        goal.save
      end
  end

end
