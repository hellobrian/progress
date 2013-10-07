class MicroGoal < ActiveRecord::Base
  attr_accessible :completion_date, :goal_id, :title

  validates :title, :completion_date, presence: true

  belongs_to :goal
  has_one :proof
end
