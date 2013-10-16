# == Schema Information
#
# Table name: proofs
#
#  id            :integer          not null, primary key
#  micro_goal_id :integer
#  lesson        :text
#  picture       :binary
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
  after_create :points_completion_goal
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

  def add_goal_points(points)
    self.micro_goal.goal.points += points
    self.micro_goal.goal.save
  end

  # Add 20 points for completing a micro goal
  def points_completion_micro_goal
    add_goal_points(20)
    add_user_points(20)
  end

  # Add 100 points for completing a goal
  def points_completion_goal
    if goal_incomplete != true
      add_user_points(100)
      add_goal_points(100)
    end
  end

  def goal_incomplete
    goal = self.micro_goal.goal
    goal.micro_goals.detect { |mg| mg.completed.nil? } 
  end

  def check_status
    user = self.micro_goal.goal.user
    if user.points < 50
      user.status = "Fresh out of the gates"
      user.save
    elsif user.points < 120
      user.status = "Achiever"
      user.save
    else
      user.status = "Go Getter!"
      user.save
    end
  end

end
