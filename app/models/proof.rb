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
  attr_accessible :completed, :lesson, :micro_goal_id, :picture
  belongs_to :micro_goal

  validates :lesson, presence: true
  validates :lesson, length: { maximum: 140 }
end
