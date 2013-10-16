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
#  points          :integer
#

require 'spec_helper'

describe Goal do
  pending "add some examples to (or delete) #{__FILE__}"
end
