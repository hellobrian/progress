# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  email            :string(255)      not null
#  date_of_birth    :date
#  gender           :string(255)
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image            :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
