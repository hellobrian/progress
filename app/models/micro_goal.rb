# == Schema Information
#
# Table name: micro_goals
#
#  id              :integer          not null, primary key
#  goal_id         :integer
#  title           :string(255)
#  completion_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  completed       :boolean
#

class MicroGoal < ActiveRecord::Base
  attr_accessible :completion_date, :goal_id, :title, :completed

  validates :title, :completion_date, presence: true

  belongs_to :goal
  has_one :proof, dependent: :destroy
end
