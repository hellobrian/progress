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
#

class Goal < ActiveRecord::Base
  attr_accessible :completion_date, :motivation, :title, :user_id

  validates :user_id, :title, :motivation, :completion_date, presence: true
  validates :motivation, length: { maximum: 255 }

  belongs_to :user
  has_many :micro_goals
  has_many :proofs, through: :micro_goals
end
