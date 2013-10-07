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

require 'spec_helper'

describe Proof do
  pending "add some examples to (or delete) #{__FILE__}"
end
