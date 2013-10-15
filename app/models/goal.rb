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

# Add 1 point when a new goal is created
# Add 5 points when a micro goal is completed
# Add 20 points when a goal is achieved
end
