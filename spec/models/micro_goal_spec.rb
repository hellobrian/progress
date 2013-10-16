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

require 'spec_helper'

describe MicroGoal do
  pending "add some examples to (or delete) #{__FILE__}"
end
