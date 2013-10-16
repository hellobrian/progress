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
  after_create :check_status

private

  def valid_proof
    self.micro_goal.completed = true
    self.micro_goal.save
  end

  def add_user_points(points)
    self.micro_goal.goal.user.points += points
    self.micro_goal.goal.user.save
  end

  # Add 20 points when a micro_goal is completed
  def points_completion_micro_goal
    self.micro_goal.goal.points += 20
    add_user_points(self.micro_goal.goal.points)
    self.micro_goal.goal.save
  end

  # Add 100 points when a goal is achieved
  def points_completion_goal?
      goal = self.micro_goal.goal
      if
        goal.micro_goals.include?(completed: nil)
        return
      else
        goal.points += 100
        add_user_points(goal.points)
        goal.save
      end
  end

  def check_status
    user = self.micro_goal.goal.user
    if user.points < 50
      user.status = "Fresh out of the gates"
    elsif user.points < 120
      user.status = "Achiever"
    else
      user.status = "Go Getter!"
    end
  end

end
