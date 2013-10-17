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

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :date_of_birth, :gender, 
                  :password, :image, :remote_image_url

  validates :first_name, :last_name, :date_of_birth, :gender, :email, presence: true
  validates :email, uniqueness: true

  has_many :goals, dependent: :destroy
  has_many :micro_goals, through: :goals

  scope :new_users, where(:created_at => ((Date.today-7)..Date.today))

  mount_uploader :image, ImageUploader

  after_create :add_status
  after_create :initialize_points

  private

  def add_status
    self.status = "Fresh out of the gates"
    self.save
  end

  def initialize_points
    self.points = 0
    self.save
  end

end
