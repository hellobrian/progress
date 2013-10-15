class GoalMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_goal_email(goal)
  end

  def completed_goal_email(goal)
  end

  def updated_goal_email(goal)
  end
  
end
