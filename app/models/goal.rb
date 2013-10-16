# == Schema Information
#
# Table name: goals
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  title           :string(255)
#  motivation      :text
#  completion_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  verb            :string(255)
#

class Goal < ActiveRecord::Base
  attr_accessible :completion_date, :motivation, :title, :user_id, :verb

  validates :user_id, :title, :motivation, :completion_date, :verb, presence: true
  validates :motivation, length: { maximum: 255 }

  belongs_to :user
  has_many :micro_goals, dependent: :destroy
  has_many :proofs, through: :micro_goals

  VERBS = %w[learn visit become stop start lose make solve improve meet build]

  after_create :points_new_goal
  after_create :check_status



  private

  # Add 5 point when a new goal is created
  def points_new_goal
    self.points = 5
    add_user_points(self.points)
    self.save
  end

  def add_user_points(points)
    self.user.points += points
    self.user.save
  end

  def check_status
    if self.user.points < 50
      self.user.status = "Fresh out of the gates"
    elsif self.user.points < 120
      self.user.status = "Achiever"
    else
      self.user.status = "Go Getter!"
    end
  end

end
